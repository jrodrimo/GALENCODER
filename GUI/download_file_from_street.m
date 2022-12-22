dir=pwd;
lat=mean([max(data_loaded.lat) min(data_loaded.lat)]);
lon=mean([max(data_loaded.lon) min(data_loaded.lon)]);
pageWeb=strcat('''','https://www.openstreetmap.org/export#map=18/',...
    num2str(lat),'/',num2str(lon),'''');
eval(strcat('web(',pageWeb,',','''','-browser','''',')'));

