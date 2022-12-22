function [data_NetWorkCell]=Network_cell_phone_read(FileName);
% function gs
% %first convert the file extention .csv to .dat and rename to shor main, i.e
% %data

% [a,b,c]=xlsread('CMWFproN_20201228_190756_meas_ainf_d0_n1000.csv');
% startRow = 2;
% dataArray = textscan(fileID,'%s%s%s',inf,'Delimiter',';',...
%     'HeaderLines', startRow-1,'ReturnOnError', false)

data_NetWorkCell = readtable(FileName);

data_NetWorkCell=table2struct(data_NetWorkCell,'ToScalar',true);

% % for k=1:column
% % 
% %     dato.lat=table2array(tabla(:,18))
% % lon=table2array(tabla(:,19))
% % c_over_noise=table2array(tabla(:,28))
% % % kml_line(lon, lat,archivo)
% % % to plot data whit column name
% % % stackedplot(T(:,20)) % DON NOT RUN
% % % convert table2array(T)
% % % tabla=table2struct(tabla);
% % % % m_proj('oblique mercator','longitudes',[-132 -125],'latitudes',[56 40],'direction','vertical','aspect',.5);
% % 
% % % covnertir posicione xy en latit longit%R %more infor https://www.eoas.ubc.ca/~rich/mapug.html#p1
% % % [LONG,LAT]=m_xy2ll(X,Y)
% % % [a b c]=unique(tabla(:,22));
% % % leyenda_frec=cell(1,length(a));
% % % % plot(smooth(smooth(smooth(tabla(:,pos_frec))),'moving',30),'g')
% % % frecuencias_todas=tabla(:,22);
% % % for k=1:length(a)
% % % %     frec=a(k);
% % % [unicas]=eq(frecuencias_todas,a(k));
% % % leyenda_frec{k}=num2str(a(k)/1e9);
% % % mean_pot_at_frec(k)=mean(tabla(unicas,16));
% % % PseudorangeRateMetersPerSecond(k)=mean(tabla(unicas,17));
% % % end
% % end
% % figure(101);bar(a,mean_pot_at_frec,1,'g');
% plotea=0
% if plotea==1;
% figure(102);
% subplot(2,1,1)
% h=bar(lat,c_over_noise,0.5,'r');grid on 
% set(gca,'xticklabel',lat);
% xlabel('Carrier in Ghz','FontSize',14);
% ylabel('Carrier/Noise (db/Hz)','FontSize',14);
% subplot(2,1,2)
% plot(smooth(smooth(smooth(c_over_noise)),'moving',30),'r','LineWidth',6)
% plot(smooth((c_over_noise),'moving',30),'r','LineWidth',6)
% xlabel('All Carriers ','FontSize',14);
% ylabel('Carriers/Noise all (db/Hz)','FontSize',14)
% grid on
end
% figure(103);plot(PseudorangeRateMetersPerSecond)

% plot(a,mean_pot_at_frec)

% plot(smooth(smooth(smooth(tabla(:,pos_frec))),'moving',30),'g')