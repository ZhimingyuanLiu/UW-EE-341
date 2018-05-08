% WINDOW: Generate ASDR signal based on the length of the input
% signal,
% then modify the input signal with the ASDR effect
% USASGE: mod = ASDR(x) outputs ASDR version of input signal
function mod = ADSR(x)

n = length(x)
A = linspace(0,2,n/8);
D = linspace(2,1.75,n/8);
S = linspace(1.75,1.75,n/2);
E = linspace(1.75,0,(n/4));

ADSR = [A,D,S,E]

mod = x.*ADSR
