function [sns3d,ctns3d,pns3d] = ribs(ilat,ilon,p1,p2,pbb,sa,ct,p)

[zi,yi,xi]=size(sa);
ns=length(pbb);

sns3d=nan*ones(ns,yi,xi);
ctns3d=sns3d;
pns3d=sns3d;

if 1
    for kk=1:ns

        point=[pbb(kk) ilat ilon];
        display(['pressure ',num2str(pbb(kk))]);
        [sns3d(kk,:,:),ctns3d(kk,:,:),pns3d(kk,:,:)] =optimize_surface_at_point(sa,ct,p,point);

    end
    %save('data/omega_3d.mat','sns3d','ctns3d','pns3d')
else
    %load('data/omega_3d.mat')
end

end