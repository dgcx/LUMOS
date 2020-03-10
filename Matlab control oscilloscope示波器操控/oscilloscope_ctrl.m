close all
clear all
%���� VISA ����'ni'Ϊ�����̲���������Ϊ agilent��NI �� tek��
%'USB0::0x1AB1::0x04B0::DS2A0000000000::INSTR'Ϊ�豸����Դ���������������������豸�����ԣ�
%�������������뻺��ĳ���Ϊ 2048
MSO2000A = visa( 'ni','USB0::0x1AB1::0x04B0::DS2F210800036::INSTR' );
MSO2000A.InputBufferSize = 2048;
%���Ѵ����� VISA ����
fopen(MSO2000A);
%��ȡ����
fprintf(MSO2000A,':STOP');
fprintf(MSO2000A,':RUN');
fprintf(MSO2000A,':MEASure:FREQuency? CHANnel%d',1);
Fre=fscanf(MSO2000A);
Fre=str2num(Fre)
fprintf(MSO2000A,':MEASure:VPP? CHANnel%d',1);
Vpp=fscanf(MSO2000A);
Vpp=str2num(Vpp)

%��ȡ����
fprintf(MSO2000A, ':wav:data?' );
%��������
[data,len]= fread(MSO2000A,2048);
%�ر��豸
fclose(MSO2000A);
delete(MSO2000A);
clear MSO2000A;
%���ݴ���
wave = data(12:len-1);
wave = wave';
subplot(211);
plot(wave);
fftSpec = fft(wave',2048);
fftRms = abs( fftSpec');
fftLg = 20*log(fftRms);
subplot(212);
plot(fftLg);
%��г��ʧ��
fftEne=fftRms.*fftRms;
total=sqrt(sum(fftEne(1,2:2048)));
THD=total/fftRms(1,1)


