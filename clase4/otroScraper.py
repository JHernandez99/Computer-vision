import requests as r
from bs4 import BeautifulSoup

req = r.get('https://www.instagram.com/')
print(req.status_code)
print(req)