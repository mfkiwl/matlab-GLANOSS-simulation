function dout=modseq(fs,f1,nt,din)
% ������������ ������������ ������������������ �������, ��������, L1 ��
% (L1SF) � �������� �������� fs

% %---- ������ �������������
% clear all; close all; clc;
% % �������� ������� ������������� �������, ��� (�� ��������� fd=50*1.023)
% fs=50*1.023
% % ������� ���������� ����� ��, ��� (�� ��������� f1=0.511)
% f1=5.11
% % ���������� �������� ������������� �������, ������� ���������� ������������
% nt=43
% % ������������������ ����� ��
% din=[1;2;3;4;5] % din=round(rand(5,1))
% % ��� ��, �������������� �� �������� ������� fs
% dout=modseq(1/5,1/21,nt,din) % dout=modseq(fs,f1,nt,din)
% %---- ����� ������� �������������

% ������������ �������� ������������� �������, ���
ts=1/fs;
% ������������ ���� ��, ���
t1=1/f1;
% ����� t1 � �������� ts
t2=t1+ts/2;
% ���������� ����� ��
nc=length(din);

t=0;
j=1;
dout=zeros(nt,1);
for i=1:nt
    t=t+ts;
%     if t>t1 % ��� ��� ��������� �������� ������������ ���_��, ��� �������
%     ������ � 2 ���� ���� ���� ��� ����� ������������� �������� �� ts/2
    if t>t2
        t=t-t1;
        if j<nc
            j=j+1;            
        else
            % ������������� ������ �����, �� ������ ���� ������ din �������
            % �������� ��� �������� ���������� fs, f1, nt
            dout=dout(1:i-1); 
            break
        end
    end
    dout(i)=din(j);
%     t=t+ts; % ����� ��������� ��� � ������ �����, ��������� �����
%     ����������� ������ ������ � ������
end

