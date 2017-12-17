mat=csvread('lamost.csv',1,0);
col=length(mat(1,:));
row=length(mat(:,1));
j=1;
for i=1:row
    if (mat(i,5)>4.0)&(4000<mat(i,3)<8000)
        new_mat(j,:)=mat(i,:);
        j=j+1;
    end
end     
ra=new_mat(:,1)'
dec=new_mat(:,2)'
teff=new_mat(:,3)'
logg=new_mat(:,5)'
feh=new_mat(:,7)'
rverr=new_mat(:,10)'
figure
subplot(2,2,1)
plot(ra,dec,'k.','MarkerSize',10)
xlabel('ra')
ylabel('dec')
legend('position')
title('ra-dec')
subplot(2,2,2)
scatter(teff,logg,2,feh，'.')
xlabel('teff')
ylabel('logg')
legend('star')
title('teff-logg')
colorbar
subplot(2,2,3)
hist(rverr,4000)
xlim([0,50])
xlabel('rverr')
ylabel('number')
title('histogram of rveer')
legend('rverr')


