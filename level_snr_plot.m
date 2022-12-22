umbral=[-105 -95];
nivel=zeros(4,length(data_loaded.signal))+NaN;
nivel(4,:)=smooth(smooth(data_loaded.signal,5),5);
for k=1:length(data_loaded.signal)
        if nivel(4,k)<=umbral(2)
            nivel(1,k)=nivel(4,k)
        else
            nivel(2,k)=nivel(4,k)
        end
        
        if nivel(4,k)>=umbral(1)
            nivel(3,k)=nivel(4,k)
        else
            nivel(3,k)=NaN
        end
end
pos(1,:)=[0.4 0.5 0.2 0.35];
pos(2,:)=[0.7 0.5 0.2 0.35];
pos(3,:)=[0.4 0.1 0.5 0.35];

subplot('Position',pos(1,:))
plot(data_loaded.lon,smooth(smooth(data_loaded.rsrq,5),5),'color',[0.5 0.5 0.5],'linewidth',6)
xlabel('Carrier in Ghz','FontSize',10);
ylabel('Carrier/Noise sqr(db/Hz)','FontSize',8);

xlim([-3.65 -3.44]); ylim([ -20 5])
grid on
subplot('Position',pos(2,:))
plot(data_loaded.lon,smooth(smooth(data_loaded.rssnr,5),5),'color',[0.5 0.5 0.5],'linewidth',6);hold on
% plot(data_loaded.lon,smooth(smooth(data_loaded.rsrq,5),5))
xlabel('Carrier in Ghz','FontSize',10);
ylabel('Carrier/Noise (db/Hz)','FontSize',10);
grid on 
xlim([-3.65 -3.44]); ylim([ -5 25])
subplot('Position',pos(3,:))
plot(data_loaded.lon,nivel(4,:),'k','linewidth',2);hold on

plot(data_loaded.lon,nivel(1,:),'or','MarkerSize',12)
plot(data_loaded.lon,nivel(2,:),'og','MarkerSize',12)
plot(data_loaded.lon,nivel(3,:),'om','MarkerSize',12)
plot(data_loaded.lon,nivel(2,:),'og','MarkerSize',12)
plot(data_loaded.lon,nivel(2,:),'*g','MarkerSize',12)
plot(data_loaded.lon,nivel(4,:)*0-105,'-m','linewidth',6)
plot(data_loaded.lon,nivel(4,:)*0-95,'-g','linewidth',6)
xlabel('Longitude ','FontSize',10);
ylabel('Signal (dBm)','FontSize',10)
% grid on 
xlim([-3.65 -3.44]);
eqtext1 =  'HIGH LEVEL SIGNAL';
eqtext2 = 'MEDIUM LEVEL SIGNAL';
eqtext3 =  'LOW LEVEL SIGNAL';

% Add the string containing the Latex expression to the plot
text(-3.56, -90, eqtext1,  'FontSize', 18, 'Color', 'g','FontSize',16)
text(-3.56, -100, eqtext2,  'FontSize', 18, 'Color', 'm','FontSize',16)
text(-3.56, -110, eqtext3, 'FontSize', 18, 'Color', 'r','FontSize',16)
grid on


    
%     data_loaded.lon, ,-105,-95)