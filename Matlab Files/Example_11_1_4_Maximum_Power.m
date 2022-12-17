clc; clear;
Vs=10; Rs=10e3; Rl=0:1e3:50e3;
k=length(Rl);
for i=1:k
    Pl(i)=((Vs/(Rs+Rl(i)))^2)*Rl(i);
end
dp=diff(Pl)./diff(Rl);
Rld=Rl(2:length(Rl));
Prod=dp(1:length(dp)-1).*dp(2:length(dp));
crit_pt=Rld(Prod<0);
max_power=max(Pl);
fprintf('Maximum Power occurs at %8.3f Ohms \n',crit_pt);
fprintf('Maximum Power Dissipation at %8.5f Watts \n',max_power);
plot(Rl,Pl,'r--');
title('Power Delivered to load');
xlabel('Load Resistance in Ohms');
ylabel('Poewer in Watts');
grid on;