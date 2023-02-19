

import requests
import bs4
import pandas as pd
import time, datetime
from loguru import logger
import pangres
import sqlalchemy
import random

import dateutil.parser

cat_tags = {
	'Free Food': 'scrape_events/events_free_food.html',
	'Career Development': 'scrape_events/events_cardev.html',
	'Courses, Seminars, and Training': 'scrape_events/events_cst.html',
}

def guess_date(date_str, time_str):
	return dateutil.parser.parse(date_str + ' ' + time_str)

def scrape_events():
	
	events_list = []

	for tag1, path in cat_tags.items():

		#html = requests.get('https://events.ucalgary.ca/all/categories/Free%20Food').text
		with open(path, encoding='utf-8') as fp: # must be rendered
			html = fp.read()

		test_count = html.count('lw-event-item')
		logger.info(f"By test count, there are {test_count} events.")

		soup = bs4.BeautifulSoup(html, 'lxml')
		
		events = soup.find_all('div', class_='lw-event-item')

		logger.info(f"Found {len(events)} events.")

		for event in events:
			logger.debug(f"Starting new event.")

			if len(event.find_all('img')) > 0:
				img = event.find_all('img')[0].get('src')
			else:
				img = None
			timeloc = event.find_all(class_='time-loc')[0].find_all('abbr')[0]['title']

			timeloc = timeloc.split(' | ')

			if len(timeloc) != 3:
				# weird format
				continue

			date_str = timeloc[0].strip()
			time_str = timeloc[1].split('to')[0].strip()
			title = event.find_all('p', class_='title')[0].get_text(strip=True)

			try:
				dt = guess_date(date_str, time_str)
			except:
				logger.warning(f"Error parsing date: {date_str} @ {time_str}")

			loc = timeloc[2]

			tag2 = None
			if tag1 != 'Free Food':
				if random.random() < 0.2:
					tag2 = 'Free Food'

			events_list.append({
				'tag1': tag1,
				'img_url': img,
				'name': title,
				'time': dt,
				'location': loc,
				'tag2': tag2,
			})


	df = pd.DataFrame(events_list)
	df = df.drop_duplicates('name', keep='last')
	df = df.set_index('name')
	logger.info(f'Got these entries:\n{df}')
	#df.to_csv('out.csv')
	
	con = sqlalchemy.create_engine('sqlite:///my_api/db.sqlite')
	pangres.upsert(con, df, 'event_item', if_row_exists='update')

	logger.info(f"Wrote {len(df)} events.")

if __name__ == '__main__':
	logger.info(f"Start.")
	scrape_events()
	logger.info(f"Done.")
