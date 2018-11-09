sigma=1.2;                                                                 %success rate
p=0;                                                                       %?terasyon ba?lang?ç say?s?
m=10;                                                                      %number of parent
lamda=3;  %number of child
 
 
con=zeros(1,500);
 
for i=1:m                                                                 
    cX(i)=rand()*randi([-100 100],1);                                          %x de?i?keni +3~-3
    cY(i)=rand()*randi([-100 100],1);                                          %y de?i?keni -2~+2
   
    tml_Fitness(i)= (1+ 1/200*((cX(i))^2+(cY(i))^2) - ((cos(cX/sqrt(1))*cos(cY/sqrt(2)))));%function Fitness fonksiyon de?eri
end
 
while p<1000                                                              %Reproduction
s=0;
k=1;
  
     for i=1:m                                                             
         for j=1:lamda                                                         
                 hX(j)=randn()*sigma;                                      %x de?i?keni +3~-3
                 hY(j)=randn()*sigma;                                      %y de?i?keni -2~+2
                 cckX(k)=cX(i)+hX(j);                                     %cocuk x hareketi
                 cckY(k)=cY(i)+hY(j);                                      %cocuk x hareketi
               t_Fitness(k)= 1+ 1/200*((cckX(i))^2+(cckY(i))^2) - (cos(cckX/sqrt(1))*cos(cckY/sqrt(2)));%function Fitness fonksiyon de?eri
                 if tml_Fitness(i) > t_Fitness(k)
                     s=s+1;
                 end
                 k=k+1;
         end
     end
     success_rate=s/(m*lamda);                                             %ba?ar? oran?
     
     if success_rate < 0.2                                                 %ba?ar? oran?n?n hesaplanmas?
         sigma=sigma*0.85;
     elseif success_rate >0.2
         sigma=sigma / 0.85;
     end
     
     for i=1:m                                                             %Selection 
         for j=1:(lamda*m)                                                 %en iyi de?ere sahip bilginin bulunmas?
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
 
    p=p+1;                                                                 %grafik çizdirme
    plot(con);
end                                                       
tml_Fitness


