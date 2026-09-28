# Toronto Ferry Sales

## Overview

This repository observes the Toronto Island ferry ticket counts dataset from Open Data Toronto, comparing the number of tickets sold and redeemed per month over a 15 month period. The repository contains any necessary data, R scripts, and files required to reproduce the analysis.


## File Structure

The repo is structured as:

-   `data/00-simulated_data` contains the simulated data of the dataset.
-   `data/01-raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/02-analysis_data` contains the cleaned dataset that was constructed.
-   `other` contains details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code were written with the help of VS Code's Copilot autocomplete tool, and ChatGPT. ChatGPT also helped in constructing the tables and graphs for the paper, and the entire chat history is available in other/llm_usage/usage.txt.