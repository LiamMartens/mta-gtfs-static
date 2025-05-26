#!/bin/bash
rm -rf gtfs_raw; mkdir -p gtfs_raw

curl -o gtfs_subway.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_subway.zip
curl -o gtfs_subway_supplemented.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_supplemented.zip
curl -o gtfs_lirr.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfslirr.zip
curl -o gtfs_mnr.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfsmnr.zip
curl -o gtfs_bus_bx.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_bx.zip
curl -o gtfs_bus_bk.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_b.zip
curl -o gtfs_bus_m.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_m.zip
curl -o gtfs_bus_qns.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_q.zip
curl -o gtfs_bus_si.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_si.zip
curl -o gtfs_bus_busco.zip https://rrgtfsfeeds.s3.amazonaws.com/gtfs_busco.zip

unzip -d gtfs_raw/subway gtfs_subway.zip; rm gtfs_subway.zip
unzip -d gtfs_raw/subway_supplemented gtfs_subway_supplemented.zip; rm gtfs_subway_supplemented.zip
unzip -d gtfs_raw/lirr gtfs_lirr.zip; rm gtfs_lirr.zip
unzip -d gtfs_raw/mnr gtfs_mnr.zip; rm gtfs_mnr.zip
unzip -d gtfs_raw/bus_bx gtfs_bus_bx.zip; rm gtfs_bus_bx.zip
unzip -d gtfs_raw/bus_bk gtfs_bus_bk.zip; rm gtfs_bus_bk.zip
unzip -d gtfs_raw/bus_m gtfs_bus_m.zip; rm gtfs_bus_m.zip
unzip -d gtfs_raw/gtfs_bus_qns gtfs_bus_qns.zip; rm gtfs_bus_qns.zip
unzip -d gtfs_raw/gtfs_bus_si gtfs_bus_si.zip; rm gtfs_bus_si.zip
unzip -d gtfs_raw/gtfs_bus_busco gtfs_bus_busco.zip; rm gtfs_bus_busco.zip
