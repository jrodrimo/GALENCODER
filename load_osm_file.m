clc 
dir=pwd;
cd('C:\Users\gasilva\Downloads\')
[openstreetmap_filename, Path]=uigetfile({'*.osm'},'Load file like .osm');
[map_img_filename, Path]=uigetfile({'*.png'},'Load file like .png');

% show_data

%  openstreetmap_filename = FileName;
% map_img_filename = 'map.png'; % image file saved from online, if available

% % %% convert XML -> MATLAB struct
% % % convert the OpenStreetMap XML Data file donwloaded as map.osm
% % % to a MATLAB structure containing part of the information describing the
% % % transportation network
[parsed_osm, osm_xml] = parse_openstreetmap(openstreetmap_filename);
cd(dir)
save data_openStreet.mat, parsed_osm, osm_xml
plot_way(handles.mean_panel, parsed_osm,map_img_filename) ;
clc
cd(dir)