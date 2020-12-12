clear,clc
close all

I = double(imread('ean13.jpg'));
[h,w,z] = size(I);
N=256
G = I(:,:,2);
R = I(:,:,1);
B = I(:,:,3);
imgY = 0.299*R + 0.587*G + 0.114*B;

figure, imshow(uint8(imgY))
[A,B] = ginput(2);


%C=A;
%A=[A(1) B(1)];
%B=[C(2) B(2)];
line(A,B)
distAB = sqrt((B(2)-A(2))^2+(B(1)-A(1))^2);

Npts = floor(distAB*1.5);
samples = zeros(2,Npts);
for i=1:Npts
    samples(:,i) = A+i/Npts*(B-A);
    samples(:,i)=round(samples(:,i));
end

I_code=zeros(1,length(samples));
for i=1:length(samples)
I_code(1,i)=imgY(samples(1,i),samples(2,i));
end
%figure,
%plot(I_code)
%h=imhist(I_code);
figure,
%plot(h)
figure,
imshow(uint8(I_code));
[minima1 argmin1]=min(I_code(1:length(I_code)/3));
[minima2 argmin2]=min(I_code(500:length(I_code)));
argmin2=argmin2+400;
vect_min1=samples(:,argmin1);
vect_min2=samples(:,argmin2);
distAB = sqrt((vect_min1(2)-vect_min2(2))^2+(vect_min1(1)-vect_min2(1))^2);

Npts = 95;
samples = zeros(2,Npts);
for i=1:Npts
    samples(:,i) = vect_min1+i/Npts*(vect_min2-vect_min1);
    samples(:,i)=round(samples(:,i));
end
I_code=zeros(1,length(samples));
for i=1:length(samples)
I_code(1,i)=imgY(samples(1,i),samples(2,i));
end
figure,
h=histogram(I_code,N);
val=zeros(1,N)
for i=1:N-1
val(i)= mu(h.Values,i,N);
end
crit=criter_hosto(h.Values,N);
[maxima argmax]=max(crit);
%plot(crit)
ylim([4000,8000])
h1=histogram(I_code,N).BinEdges(argmax);
h2=histogram(I_code,N).BinEdges(argmax+1);
h_moy=(h1+h2)/2;
I_code=I_code>h_moy;
%figure,
%title("signature")
%plot(I_code);
I_code_str=[];
for i=1:length(I_code)
    if(I_code(i)==0)
       I_code_str=[I_code_str 'N'];
    else
       I_code_str=[I_code_str 'B'];
    end
end
%% 
I_code_str='AAABBBNNBNBBNNBBNBBNBBNNBNNNNBNBNBBBNNBNNBBBNBNBNNNNBNNNBNNBNNBNNNBBBNBNNBBBNNBNBBNNBBNBBNBBNNBNNNNBNBNBBBNNBNNBBBNBNBNNNNBNNNBNNBNNBNNNBBBNBNN';
I_code_str(:,4:4+7-1);
% a=4;
% b=7+4-1;
% fun=search_struct(I_code_str(:,4:4+7-1));
% chiffre_barre=[];
% for i=1:6
%     I=I_code_str(:,a:b);
%     chiffre_barre=[chiffre_barre search_struct(I)]; 
%     a=a+7;
%     b=b+7;
%    
% end
I_code=I_code_str(:,4:end);
chiffre1=chiffrement(I_code);
I_code2=I_code_str(:,51:end);
chiffre2=chiffrement(I_code2);

%chiffre_barre=chiffrement(I_code_str);
%J=I_code_str(:,51:end);
%chiffre_barre=chiffrement(J);



