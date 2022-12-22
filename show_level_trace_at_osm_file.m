load('data_openStreet.mat')
load('data_loaded.mat')
margenes=[str2double(osm_xml.bounds.Attributes.minlon)
str2double(osm_xml.bounds.Attributes.maxlon)
str2double(osm_xml.bounds.Attributes.minlat)
str2double(osm_xml.bounds.Attributes.maxlat)
];
pos_red=[knnsearch(data_loaded.lon,margenes(1)) knnsearch(data_loaded.lon,margenes(2)) knnsearch(data_loaded.lat,margenes(3)) knnsearch(data_loaded.lat,margenes(4))]
u=data_loaded.lon(pos_red(1):pos_red(2));
uu=data_loaded.lat(pos_red(3):pos_red(4));

[long lon_lat]=min([length(u) length(uu)])
if lon_lat==1 %en funcion de que dimensione es mas pequeña me quedo con esa
'longitud mas pequeño'

lon=data_loaded.lon(pos_red(1):pos_red(2));
lat=data_loaded.lat(pos_red(1):pos_red(2));
level=[(smooth(smooth(data_loaded.signal(pos_red(1):pos_red(2)),5),5))];
% figure(7)
% subplot(2,1,1)
% plot(lon,lat)
else lon_lat==2
    
'latitud mas pequeño'

lat=data_loaded.lat(pos_red(3):pos_red(4));
lon=data_loaded.lon(pos_red(3):pos_red(4));
level=[(smooth(smooth(data_loaded.signal(pos_red(3):pos_red(4)),5),5))];
figure(7)
subplot(2,1,2)
plot(lon,lat)
end

%%

% diagonal=max([length(u) length(uu)]);
% % lat=data_loaded.lat;
% % lon=data_loaded.lon;
% lat=linspace(margenes(1),margenes(2),length(data_loaded.lat));
% lon=linspace(margenes(3),margenes(4),length(data_loaded.lon));
% level=[(smooth(smooth(data_loaded.signal,50),50))];
% % level=level./max(level);
% % level=data_loaded.signal;
matriz_values=zeros(length(lat)+20,length(lon)+20)+0;

matriz_values_red=zeros(length(lat),length(lon))+0;
[fil col]=size(matriz_values);
for k=1:length(level)
matriz_values(k+10,k+10)=level(k);
end

for k=1:length(level)
    k
    [t tt ]=min(matriz_values(k+10,:));
    v_posiciones=[1 tt-5 tt tt+5 fil];
    v_valores=matriz_values(k+10,v_posiciones);
    v_valores(2)=matriz_values(k+10,tt)*0.5;
    v_valores(4)=matriz_values(k+10,tt)*0.5;
    v_inter=interp1(v_posiciones,v_valores,(1:1:length(level)+20),'PCHIP');
    matriz_values_red(k,:)=v_inter(10:end-11);
end
% figure(2)

co = [1 0 0;0 1 0;0 0 1];
% set(gca,'nextplot','replacechildren')
set(gca,'colororder',co)
% contour(peaks,'-')

contour(lon,lat,10*log10(matriz_values_red),'linewidth',3) ;
% colormap(gray)
% h(2).LineWidth = 2;

%  surfc(lon,lat,10.*log(matriz_values_red))
%  [C,h] = contour(lon,lat,matriz_values_red)
%  allH = allchild(h);
% valueToHide = 0.1;
% patchValues = cell2mat(get(allH,'UserData'));
% patchesToHide = patchValues == valueToHide;
% set(allH(patchesToHide),'FaceColor','w','FaceAlpha',.1);
 
%%
% 
% contourf(lon,lat,matriz_values_red,...
%             'edgecol','interp',...
%             'linew',7,...
%             'edgealpha',1);



'ok'
%%
figuras=0
if figuras==1%%
figure(20)
subplot(2,2,1)
meshc(lon,lat,-1*matriz_values_red);% look imp
% % %  view(85, 50)
% colorbar
% % % % % % % % 'axis ['latitud az menor a mayor -3' 'longitud de menor a mayor 40']'

% meshc(handles.mean_panel,lon,lat,(matriz_values_red));
% view(0,90)
%  figure(13)
subplot(2,2,2)
contourf(lon,lat,matriz_values_red)
% contourf(handles.mean_panel,lon,lat,(matriz_values_red))
subplot(2,2,3)
% figure(14)
surf(lon,lat,-1*(matriz_values_red))

% colorbar
subplot(2,2,4)
mesh(lon,lat,(matriz_values_red))

% view(0,90)
end