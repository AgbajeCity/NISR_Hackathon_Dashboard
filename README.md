# NISR_Hackathon_Dashboard
NISR GDP Dashboard

Interactive dashboard for visualizing Rwanda's quarterly GDP data published by the National Institute of Statistics of Rwanda (NISR). Created for NISR's Inter-Universities Data Science Competition 2023.

Datasets

The dashboard visualizes the following dataset provided by NISR:

- GDP.xlsx - Contains quarterly GDP estimates for Rwanda from Q1 2017 to Q2 2023. Key variables:
  - GDP at current prices (billion RWF)
  - GDP at constant 2017 prices (billion RWF) 
  - GDP growth rates (%)
  - GDP deflators (2017=100)
  - Breakdown of GDP by economic activity (agriculture, industry, services etc.)

Dashboard Features

The interactive dashboard allows users to explore the GDP data through the following visualizations:

- Time series chart - Tracks overall GDP over time. Filterable by date range.

- Growth rate plot - Visualizes quarterly and annual GDP growth rates.

- Sectoral composition - Stacked bar chart showing GDP composition by economic sector.

- Summary stats - Key GDP indicators presented in a clean summarized view. 

- Current vs constant prices - Line charts comparing GDP at current vs constant prices.

- Deflators - Line chart showing deflators for total GDP and by sector. 

- Geo map - Choropleth map showing GDP per capita by district (coming soon).

Usage Instructions

To run the dashboard locally:

1. Install R and RStudio
2. Install this R Rackage: Shiny
3. Clone this repository
4. Open app.R in RStudio and click 'Run App'
5. Access the dashboard at Streamlit

Potential areas for development include:

- Advanced interactive functionality 
- Statistical forecasting of GDP
- Incorporating additional economic indicators
- Custom colour themes and layouts
