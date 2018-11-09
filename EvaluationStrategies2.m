sigma=1.2;                                                                 %success rate
p=0;                                                                       %İterasyon başlangıç sayısı
m=10;                                                                      %number of parent
lamda=3;                                                                   %number of child
 
x = -32.768;
y = 32.768;
 
con=zeros(1,1000);
 
for i=1:m                                                                 
    cX(i)=(y-x).*rand() + x;                                               %x değişkeni 
    cY(i)=(y-x).*rand() + x;                                               %y değişkeni 
    tml_Fitness(i)=(-20*exp((-1/5)*sqrt(abs(1/2*(cX(i)^2+cY(i)^2))))-(exp((1/2)*(cosd(2*pi*cX(i))+cosd(2*pi*cY(i)))))+20+exp(1));%function Fitness fonksiyon değeri
end
 
 
while p<500                                                                %Reproduction
s=0;
k=1;
     for i=1:m                                                             
         for j=1:lamda                                                         
                 hX1(j)=((y-x).*rand()+x)*sigma;                           %x değişkeni 
                 hX2(j)=((y-x).*rand()+x)*sigma;                           %y değişkeni 
                 cckX(k)=cX(i)+hX1(j);                                    %cocuk x hareketi
                 cckY(k)=cY(i)+hX2(j);                                    %cocuk x hareketi
                 t_Fitness(k)=(-20*exp((-1/5)*sqrt(abs(1/2*(cckX(k)^2+cckY(k)^2))))-(exp((1/2)*(cosd(2*pi*cckX(k))+cosd(2*pi*cckY(k)))))+20+exp(1));  %function Fitness fonksiyon değeri
                 if tml_Fitness(i) > t_Fitness(k)
                     s=s+1;
                 end
                 k=k+1;
         end
     end
     
     success_rate=s/(m*lamda);                                             %başarı oranı
     
     if success_rate < 0.2                                                 %başarı oranının hesaplanması
         sigma=sigma*0.85;
     elseif success_rate >0.2
         sigma=sigma / 0.85;
     end
     
     for i=1:m                                                             %Selection                                                         
         for j=1:(lamda*m)                                                 %en iyi değere sahip bilginin bulunması
             if t_Fitness(j) < tml_Fitness(i)
                 cX(i)=cckX(j);
                 cY(i)=cckY(j);
                 tml_Fitness(i)=t_Fitness(j);
                 t_Fitness(j)=10000;
             else
                 tml_Fitness(i)=tml_Fitness(i);
             end
             con(p+1)=tml_Fitness(i);
         end
     end
    p=p+1;
    plot(con);
end
tml_Fitness
