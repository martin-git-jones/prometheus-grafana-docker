# Example steps to import a dashboard
# See https://grafana.com/docs/grafana/latest/http_api/create-api-tokens-for-org/
# 

# First create an Organisation
curl -X POST -H "Content-Type: application/json" -d '{"name":"apiorg"}' http://admin:admin@localhost:3000/api/orgs

# Assume the Org number returned is 2
# then swtich to this Org
curl -X POST http://admin:admin@localhost:3000/api/user/using/2

# Now get an API key
curl -X POST -H "Content-Type: application/json" -d '{"name":"apikeycurl", "role": "Admin"}' http://admin:admin@localhost:3000/api/auth/keys

# Example output showing the key
{"id":1,"name":"apikeycurl","key":"eyJrIjoienlDMjZWS1VkaHhqZWE2VHFCRkVrdkFYUlZkRnI2NGEiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoyfQ=="}

# Use this key to import the JSON for the dashboard
curl -X POST --insecure -H "Authorization: Bearer eyJrIjoienlDMjZWS1VkaHhqZWE2VHFCRkVrdkFYUlZkRnI2NGEiLCJuIjoiYXBpa2V5Y3VybCIsImlkIjoyfQ==" -H "Content-Type: application/json" -d '{
"dashboard": {
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": "-- Grafana --",
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 0,
  "id": 1,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "datasource": {
        "type": "prometheus",
        "uid": "Prometheus"
      },
      "description": "Total http requests to pingapp",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 9,
        "w": 12,
        "x": 0,
        "y": 0
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom"
        },
        "tooltip": {
          "mode": "single"
        }
      },
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "Prometheus"
          },
          "exemplar": true,
          "expr": "http_requests_total",
          "format": "time_series",
          "interval": "",
          "legendFormat": "http_requests_total",
          "refId": "A"
        }
      ],
      "title": "HTTP REQUESTS",
      "type": "timeseries"
    }
  ],
  "refresh": "1m",
  "schemaVersion": 34,
  "style": "dark",
  "tags": [],
  "templating": {
    "list": []
  },
  "time": {
    "from": "now-6h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "pingapp-http_requests_total",
  "uid": "7GITgO17k",
  "version": 1,
  "weekStart": ""
  }
}' http://localhost:3000/api/dashboards/db
