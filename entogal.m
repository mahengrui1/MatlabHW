function [l,b]=entogal(ra,dec);
raGP=192.85948;deltaGP=27.12825;
lcp=122.932;
%import constants
b=asind(sind(deltaGP)*sind(dec)+...
    cosd(deltaGP)*cosd(dec)*cosd(ra-raGP))
%galactic latitude
l1_1=asind(cosd(dec)*sind(ra-raGP)/cosd(b))
l1_2=180-l1_1
%sin(180-x)=sinx
l2_1=acosd((cosd(deltaGP)*sind(dec)-...
    sind(deltaGP)*cosd(dec)*cosd(ra-raGP))/cosd(b))
l2_2=-l2_1
%cos(-x)=cosx
%由于反三角函数的值域限制，手动添加所有可能的值
if (abs(l1_1-l2_1)<0.01) || (abs(l1_1-l2_2)<0.01);
    l=lcp-l1_1;
elseif (abs(l1_2-l2_1)<0.01) || (abs(l1_2-l2_2)<0.01);
    l=lcp-l1_2;
end
%比较用sin和cos算出的银经，取能够对应的值为l
display([l,b])
