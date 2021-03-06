% subsample and convert sp to sa
clear all

% Load selected variables.
vars = {'s','ct','p','lats','longs'};
load('/home/z3439823/mymatlab/omega/data_paul/gk_ak_gamma.mat', vars{:})

ilon=[1:4:length(longs)];
ilat=[2:4:length(lats)];

s=s(:,ilat,ilon);
ct=ct(:,ilat,ilon);
p=p(:,ilat,ilon);
lat=lats(ilat);
lon=longs(ilon);

ss=size(s);
lon=repmat(permute(lon,[3,2,1]),[ss(1),ss(2),1]);
lat=repmat(permute(lat,[3,1,2]),[ss(1),1,ss(3)]);
    
% convert sp to sa
s=gsw_SA_from_SP(s,p,lon,lat);

lats=lat;
longs=lon;

save('data/input_data.mat',vars{:})

