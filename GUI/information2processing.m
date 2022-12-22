% %first convert the file extention .csv to .dat and rename to shor main, i.e
% %data
TABLA = readtable('G_H.csv');

fila_1=table2array(TABLA(:,22));
[a b c]=unique(fila_1);
leyenda_frec=cell(1,length(a));
a=double(a(:,1));
% plot(smooth(smooth(smooth(TABLA(:,pos_frec))),'moving',30),'g')
frecuencias_todas=table2array(TABLA(:,22));

for k=1:length(a)
%     frec=a(k);
[unicas]=eq(frecuencias_todas,a(k));
leyenda_frec{k}=num2str(a(k)/1e9);
mean_pot_at_frec(k)=mean(table2array(TABLA(unicas,16)));
PseudorangeRateMetersPerSecond(k)=mean(table2array(TABLA(unicas,17)));
end
% figure(101);bar(a,mean_pot_at_frec,1,'g');
figure(102);
subplot(2,1,1)
h=bar(mean_pot_at_frec,0.5,'g');grid on 
set(gca,'xticklabel',leyenda_frec);
xlabel('Carrier in Ghz','FontSize',14);
ylabel('Carrier/Noise (db/Hz)','FontSize',14);
subplot(2,1,2)
plot(smooth(smooth(smooth(table2array(TABLA(:,16)))),...
    'moving',30),'r','LineWidth',6)
xlabel('All Carriers ','FontSize',14);
ylabel('Carriers/Noise all (db/Hz)','FontSize',14)
grid on
% figure(103);plot(PseudorangeRateMetersPerSecond)

% plot(a,mean_pot_at_frec)

% plot(smooth(smooth(smooth(TABLA(:,pos_frec))),'moving',30),'g')