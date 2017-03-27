function activate_actuator(~, Vi, acc)

ti = 0:1/10:2;
figure;
distance = Vi*ti + 0.5*acc*ti;

plot(ti,distance);

end