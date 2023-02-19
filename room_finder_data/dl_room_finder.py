import pandas as pd
import requests
from tqdm import tqdm
from loguru import logger

def do_scrape():
    """ Do the main scrape. """
    main_content = requests.get('https://www.arcgis.com/sharing/rest/content/items/2e1817b41cb64815a50f617593aabf4e/data').json()

    polygon_content = requests.get('https://services5.arcgis.com/oegdSE8JU1e7fUHu/arcgis/rest/services/UC_Buildings/FeatureServer/0/query?where=0%3D0&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&relationParam=&returnGeodetic=false&outFields=&returnGeometry=true&returnCentroid=false&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&defaultSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token=')
    # source: https://stackoverflow.com/questions/50161492/how-do-i-scrape-data-from-an-arcgis-online-map
    # data source: https://ucalgary-gs.maps.arcgis.com/apps/webappviewer/index.html?id=2e1817b41cb64815a50f617593aabf4e

    # alternative technique: https://community.esri.com/t5/arcgis-rest-api-questions/scraping-data-from-web-map-with-embedded-data/td-p/1028828

    # option for the future: https://docs.fleaflet.dev/usage/layers

    # idea ended by being scrapped

if __name__ == '__main__':
    do_scrape()
