% plot scalar as function of iterations, e.g. rms slope error
clear all;
close all;

varname= 'eps_rms_hist';


%colors=[0 0 0; 1 0 0; 0 1 0; 0 0 1;1 0 0; 0 1 0; 0 0 1];
colors=[0 0 0; 1 0 0; 0 1 0;1 0 0; 0 1 0];
set(0,'defaultaxescolororder',colors);
%linestyles={'-','-','-','-','--','--','--'};
linestyles={'-','-','-','--','--'};
linewidths=[2,1,1,1, 1,1,1];


%set(0,'DefaultAxesLineStyleOrder',{'--',':'})
sz=5.0*[10 8];
figure('PaperSize',sz,'PaperPosition',[0 0 sz(1) sz(2)],'Visible','off') 
set(0,'DefaultAxesFontSize',25)

%dir={'127','128','130','131','132','133','134'};
%ls={'coeff: 0','coeff: 1','coeff: 2','coeff: 3','coeff: -1','coeff: -2','coeff: -3'};
dir={'127','130','135','133','136'};
dir={'137','138','139','140','141'};
dir={'142','143','144','145','146'};
dir={'147','148','149','150','151'};

ls={'coeff: 0','coeff: 2','coeff: 4','coeff: -2','coeff: -4'};


fname=['../exp',dir{1},'/data/iteration_history.mat'];
load(fname, varname);
nit=size(eps_rms_hist,1);
vv=nan*ones(length(dir),nit);


for ii=1:length(dir);
    fname=['../exp',dir{ii},'/data/iteration_history.mat'];
    load(fname, varname);
    vv(ii,:)=eps_rms_hist; % variable to plot
end

% subtract default experiment and remove
%vv=vv-bsxfun(@times, vv(1,:), ones(size(vv,1),1));
%vv=vv(2:end,:);

xax=[0:size(vv,2)-1];
h=semilogy(xax,vv)
for ii=1:length(h)
    set(h(ii),'linestyle',linestyles{ii})
    set(h(ii),'linewidth',linewidths(ii))
end
% linestyles={'-','--','--','--',':',':',':'};
% colors=[0 0 0; 1 0 0; 1 0 0; 1 0 0; 0 0 1; 0 0 1; 0 0 1];
% set(gca,'colororder',colors);
% set(gca,'linestyleorder',linestyles);
hold on
xlabel('Iterations')
ylabel('$\sqrt{\overline{\epsilon^2}}\quad [m^{-1}]$','interpreter','latex')
ylim([0 2e-11])
xlim([0 2])
%xlim([2 10])

grid on
legend(ls)
print('-dpdf','-r200',['figures/eps_rms_0-2_',dir{1},'-',dir{end}])
