%%%%      Particle Swarm Optimization     %%%%

 
c1=2;                                               %Öğrenme faktörleri
c2=c1;                                                      %Öğrenme faktörleri
w=1;
k=1;
z=1;                                                %iterasyon başlangıç sayısı
 
for i=1:20
 
x=rand()*randi([-3 3],1);                                  %x değişkeni +3~-3
y=rand()*randi([-2 2],1);                                    %y değişkeni -2~+2
 
fitness=(4-2.1*(x^2)+(x^4)/3)*x^2+x*y+(-4+4*(y^2))*y^2;    %fitness fonksiyon hesabı
 
prt(i,1)=x;                                                                %i. x değeri
prt(i,2)=x;                                                                %current x
prt(i,3)=y;                                                                %i. y değeri
prt(i,4)=y;                                                                %current y
prt(i,5)=fitness;                                             %i. fitness değeri
Vx(i)=0;                                           %x vektörünün başlangıç hızları
Vy(i)=0;                                    %y vektörünün başlangıç hızları
 
end 
 
 gfitness=min(prt(:,5));                                  %en iyi fitness değeri
 
 while z<1000                                           %iterasyon başlangıcı
     
     fF(z,1)=gfitness;                            %global fitness değerleri
     
    for i=1:20
        if gfitness == prt(i,5) 
        cX=prt(i,2);                               %en iyi fitness değerine sahip x
        cY=prt(i,4);                            %en iyi fitness değerine sahip y
        end
    end
    
    for i=1:20
        Vx(i)= k*(w* Vx(i) +c1*rand()*(prt(i,1)-prt(i,2))+c2*rand()*(cX-prt(i,2)));% yeni lokasyon x yönü hızı
        Vy(i)= k*(w* Vy(i) +c1*rand()*(prt(i,3)-prt(i,4))+c2*rand()*(cY-prt(i,4)));% yeni lokasyon y yönü hızı
        prt(i,2)=prt(i,2)+Vx(i);                            %x'in yeni konumu
        prt(i,4)=prt(i,4)+Vy(i);                                %y'nin yeni konumu
        prt(i,5)=(4-2.1*(prt(i,2)^2)+(prt(i,2)^4)/3)*prt(i,2)^2+prt(i,2)*prt(i,4)+(-4+4*(prt(i,4)^2))*prt(i,4)^2;%yeni lokasyon fitness fonksiyon hesabı
 
    
        nfitness=prt(i,5);               %i. iterasyondaki yeni fitness değeri 
        
        if nfitness < gfitness            %fitness değerlerinin karşılaştırılması
                
            gfitness=nfitness;
                
                for i=1:20
                    if gfitness == prt(i,5) 
                        cX=prt(i,2);                %en iyi fitness değerine sahip x
                        cY=prt(i,4);              %en iyi fitness değerine sahip y
                    end
                end
        end
     end   
    z=z+1;                                            %iterasyon sayısını arttır
 end                                                            %iterasyon bitişi
 
plot(fF,'r.-')                                                            %grafik çizdirme
legend('Objective')
 
cX                                                    %x değerinin ekranda görüntülenmesi
cY                                                     %y değerinin ekranda görüntülenmesi
gfitness                                  %global fitnessdeğerinin ekranda görüntülenmesi
