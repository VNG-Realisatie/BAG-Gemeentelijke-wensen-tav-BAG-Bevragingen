
# flake8: noqa

# Import all APIs into this package.
# If you have many APIs here with many many models used in each API this may
# raise a `RecursionError`.
# In order to avoid this, import only the API that you directly need like:
#
#   from .api.adres_api import AdresApi
#
# or import this package, but before doing it, use:
#
#   import sys
#   sys.setrecursionlimit(n)

# Import APIs into API package:
from openapi_client.api.adres_api import AdresApi
from openapi_client.api.adresseerbaar_object_api import AdresseerbaarObjectApi
from openapi_client.api.pand_api import PandApi
