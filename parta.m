format long
noload;
time = TEST(:,1)/1000;
speed = TEST(:,3);
inputV = 24;
A = max(speed)/inputV;

timeC = 0.632*max(speed);
tau = time(find(speed >timeC,1));

syms s
syms t
G = A/(1+tau*s)*(1/s);
Gp = G*24;
% t_equ = ilaplace(G*(1/s))
equ = ilaplace(Gp);
interval=(0:0.008:0.4);
figure(1);clf;hold on;
plot(time,speed);
plot(time,eval(subs(equ,time)));
xlabel("Time (s)");
ylabel("Speed (count/s)");

title("Speed vs Time");
legend('Experimental','Theoretical');
hold off

T = 0.002;
num = [24*A];
den = 126*[tau 1 0];
[numd, dend] = c2dm(num,den,T,'zoh');
disp("find A(z)part")
disp(roots(numd));
disp(roots(dend));
C = 1/numd(2)
Az = C
