import coloredlogs, logging

logger = logging.getLogger(__name__)

coloredlogs.install(level='DEBUG', logger=logger)

logger.info("Programa python de ejemplo")

def add_one(number):
    return number + 1