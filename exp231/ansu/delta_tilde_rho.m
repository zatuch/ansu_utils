function [drhodx,drhody,drhody_new] = delta_tilde_rho(sns,ctns,pns)


%   _________________________________________________________________
%   This is part of the analyze_surface toolbox, (C) 2009 A. Klocker
%   Partially modified by P. Barker (2010-13)
%   Partially modified by S. Riha (2013)
%   Principal investigator: Trevor McDougall
%   type 'help analyze_surface' for more information 
%   type 'analyze_surface_license' for license details
%   type 'analyze_surface_version' for version details
%

user_input;

%% initialize

[yi,xi] = size(sns);

%% calculate density gradients referred to mid-point pressures

pmid=0.5*(pns+circshift( pns, [0,-1]));

r1=gsw_rho(sns(:,:),ctns(:,:),pmid);
r2=gsw_rho( circshift(sns(:,:), [0 -1])  , circshift( ctns(:,:), [0 -1]) ,pmid);

drhodx=r2-r1;

if ~zonally_periodic;
    drhodx(:,xi) = nan;
end


pmid=0.5*(pns+circshift( pns, [-1,0]));

r1=gsw_rho(sns(:,:),ctns(:,:),pmid);
r2=gsw_rho( circshift(sns(:,:), [-1 0])  , circshift( ctns(:,:), [-1 0]) ,pmid);

drhody=r2-r1;

drhody(yi,:) = nan;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pmid=0.5*(pns+circshift( pns, [-1,0]));
smid=0.5*(sns+circshift( sns, [-1,0]));
ctmid=0.5*(ctns+circshift( ctns, [-1,0]));

aa=gsw_alpha(sns,ctns,pns);
ab=circshift(aa, [-1 0]);
am=gsw_alpha(smid,ctmid, pmid);
ra=gsw_rho(sns,ctns,pns);
rb=circshift(ra, [-1 0]);
rm=gsw_rho(smid,ctmid, pmid);

fac=2*ra.*rb.*aa.*ab./(rm.*am.*(rb.*ab+ra.*aa));

drhody_new=fac.*drhody;


% second order finite differenc
% alpha=gsw_alpha(sns,ctns,pns)
% alpha_= circshift(alpha, [-1 0])+alpha;
% 
% pmid=0.5*(pns+circshift( pns, [-1,0]));
% smid=0.5*(sns+circshift( sns, [-1,0]));
% ctmid=0.5*(ctns+circshift( ctns, [-1,0]));
% 
% alphamid=2.*gsw_alpha(smid,ctmid, pmid);
% 
% alphappy=alpha_-alphamid;
% alphappy(end,:)=nan;



