data2=csvread("features.csv");
l=length(data2)
k_data=data2(:,1);
s_data=data2(:,2);
m_data=data2(:,3);
wl_data=data2(:,4);
zc_data=data2(:,5);
%% 

k_mean=mean(k_data)
k_std=std(k_data)
s_mean=mean(s_data)
s_std=std(s_data)
m_mean=mean(m_data)
m_std=std(m_data)
wl_mean=mean(wl_data)
wl_std=std(wl_data)
zc_mean=mean(zc_data)
zc_std=std(zc_data)
%% 
for i=1:1:l
    k=(k_data(i)-k_mean)/k_std;
    s=(s_data(i)-s_mean)/s_std;
    m=(m_data(i)-m_mean)/m_std;
    wl=(wl_data(i)-wl_mean)/wl_std;
    zc=(zc_data(i)-zc_mean)/zc_std;
    writematrix([k s m wl zc],'featuresNormalised.csv','Delimiter','comma','WriteMode','append')
end


