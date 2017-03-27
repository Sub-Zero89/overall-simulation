%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   PROJECT SIMULATION   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% All dimesions are in INCHES

% bench_hook = x;                         % length of bench hook
arm = 25;                                 % average arm length
b_height = 18;                        % sample bench height
a_height = 10;                     % linear actuator length at rest
r_time = 1.5;                             % preferred reaction time in SECS
stand = 5;                                   % between 10 and 18

d = 0.1;
t = 0:d:15;
lactate = (1/1)*t;     % lactate in mmol/L
arm_level = (arm*cos(2*pi*(1/1.4)*t) + arm)/2;
indx = find(lactate == 4);
arm_level = [arm_level(1:indx), arm_level(indx)*ones(1, length(arm_level)-indx)];

Vi = 0;                                                 % initial velocity
saviour_dist = arm_level(indx)+stand+b_height-a_height; % distance to weights
des_acc = saviour_dist*2/(r_time^2);
figure;
plot(t,arm_level);

for k = 1:length(t)
    if lactate(k) == 4
        disp('User saved');
        activate_actuator(t, Vi, des_acc);
    end
end

%Needed
%Sensor (with speed?)
%
