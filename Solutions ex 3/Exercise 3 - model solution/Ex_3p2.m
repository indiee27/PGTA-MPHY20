% Load RT data:
load('RTdata.mat');

% Dose volume histograms (DVHs) will be computed for these dose values:
dose_vals = 0:70;

% Compute DVHs for all four structures and measure the computation time:
% Note: non-vectorised code is called.
tic;
    brainstem_dvh       = calcDVHSlow(dose,brainstem,dose_vals);
    ctv_dvh             = calcDVHSlow(dose,ctv,dose_vals);
    r_parotid_dvh       = calcDVHSlow(dose,r_parotid,dose_vals);
    spinal_canal_dvh    = calcDVHSlow(dose,spinal_canal,dose_vals);
t_slow = toc;
fprintf('Computation time without vectorisation:     %g s\n',t_slow);

% Display output:
figure;
hold on;
    plot(dose_vals,brainstem_dvh,'b','linewidth',2);
    plot(dose_vals,ctv_dvh,'r','linewidth',2);
    plot(dose_vals,r_parotid_dvh,'g','linewidth',2);
    plot(dose_vals,spinal_canal_dvh,'k','linewidth',2);
hold off;
xlabel('Dose (Gy)');
ylabel('% of volume');
title('DVH - non-vectorised code');
legend('brainstem','CTV','right parotid','spinal canal','location','best');




% ======== Now repeat the computations using vectorised code: ========

% Using vectorised code to remove loops across all voxels:
tic;
    brainstem_dvh_fast      = calcDVHFast(dose,brainstem,dose_vals);
    ctv_dvh_fast            = calcDVHFast(dose,ctv,dose_vals);
    r_parotid_dvh_fast      = calcDVHFast(dose,r_parotid,dose_vals);
    spinal_canal_dvh_fast   = calcDVHFast(dose,spinal_canal,dose_vals);
t_fast = toc;
fprintf('Computation time with vectorisation:        %g s\n',t_fast);

% Using vectorised code to remove ALL loops:
tic;
    brainstem_dvh_NoLoop    = calcDVHNoLoops(dose,brainstem,dose_vals);
    ctv_dvh_NoLoop          = calcDVHNoLoops(dose,ctv,dose_vals);
    r_parotid_dvh_NoLoop    = calcDVHNoLoops(dose,r_parotid,dose_vals);
    spinal_canal_dvh_NoLoop = calcDVHNoLoops(dose,spinal_canal,dose_vals);
t_NoLoops = toc;
fprintf('Computation time with ALL loops suppressed: %g s\n',t_NoLoops);

% Finally, check whether the DVHs computed with all methods are the same:
if isequal(brainstem_dvh,brainstem_dvh_fast) && isequal(brainstem_dvh,brainstem_dvh_NoLoop)
    disp('Brainstem:     same results obtained for all methods.')
else
    disp('Brainstem:     different results found!');
end

if isequal(ctv_dvh,ctv_dvh_fast) && isequal(ctv_dvh,ctv_dvh_NoLoop)
    disp('CTV:           same results obtained for all methods.')
else
    disp('CTV:           different results found!');
end

if isequal(r_parotid_dvh,r_parotid_dvh_fast) && isequal(r_parotid_dvh,r_parotid_dvh_NoLoop)
    disp('Right parotid: same results obtained for all methods.')
else
    disp('Right parotid: different results found!');
end

if isequal(spinal_canal_dvh,spinal_canal_dvh_fast) && isequal(spinal_canal_dvh,spinal_canal_dvh_NoLoop)
    disp('Spinal canal:  same results obtained for all methods.')
else
    disp('Spinal canal:  different results found!');
end