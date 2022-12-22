function [data_NetWorkCell]=load_file(hObject, eventdata, handles);
clc
[FileName, Path]=uigetfile({'*.csv'},'Abrir documento');


if isequal(FileName,0)
      return;
else
  [data_NetWorkCell]= Network_cell_phone_read(FileName);
clc


%     fid=fopen(strcat(Path,FileName),'r');
%      tabla = readtable(FileName)
%      tline = fgetl(fid);
%      i=1;
%     while ischar(tline)
%         X(i,:)=tline;
%         tline = fgetl(fid);
%         i=i+1;
%     end
end