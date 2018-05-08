function thumbnail = scaleimage(G, S)
a=mod(S, 2);
if a==0
    thumbnail=G(S/2:S:end,S/2:S:end);
else 
    thumbnail=G(((S+1)/2):S:end,((S+1)/2):S:end);  
end



end
