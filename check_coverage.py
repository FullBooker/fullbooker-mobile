#!/usr/bin/python3
import os
import re
import string
import sys

from bs4 import BeautifulSoup

THRESHOLD = 4.5

current_dir = os.getcwd()
coverage_file_path = os.path.join(current_dir, "coverage/index.html")
cov = None

with open(coverage_file_path) as file:
    soup = BeautifulSoup(file, "lxml")
    covHi = soup.find(attrs={"class": "headerCovTableEntryHi"})
    covMed = soup.find(attrs={"class": "headerCovTableEntryMed"})
    covLow = soup.find(attrs={"class": "headerCovTableEntryLo"})

    if hasattr(covHi, "string") and covHi.string != "-":
        cov = covHi.string
    elif hasattr(covMed, "string") and covMed.string != "-":
        cov = covMed.string
    elif hasattr(covLow, "string") and covLow.string != "-":
        cov = covLow.string

pattern = r"[{}]".format(string.punctuation)
cov = re.sub(pattern, "", cov).strip().lower()
cov = round(float(cov), 1)
cov = (cov / 1000) * 100

if cov < THRESHOLD:
    print(f"Test coverage threshold {cov} is lower than expected {THRESHOLD}%")
    sys.exit(1)
else:
    print(f"Test coverage is ok {cov}%")
    sys.exit(0)
