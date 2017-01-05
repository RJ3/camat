function plotprocess

%% Plotting process
% Plot the points of interest
% Plot the t0 Point
plot(time(loct0),avesig(loct0),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the Initialize Upstroke Point
plot(time(locup),avesig(locup),'ro','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% plot the 90% upstroke point
plot(time(loc90),avesig(loc90),'m^','MarkerSize',8,'MarkerFaceColor','k','MarkerEdgeColor','k');
% Plot the Peak Point
plot(time(locpk),avesig(locpk),'mo','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% plot(time(lp1),avesig(lp1),'m^','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','m');
plot(time(lp2),avesig(lp2),'mv','Markersize',8,'MarkerFaceColor','m','MarkerEdgeColor','k');
% Plot the cad50 ending
plot(time(cad50_end),avesig(cad50_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the cad90 ending
plot(time(cad90_end),avesig(cad90_end),'cs','Markersize',8,'MarkerFaceColor','c','MarkerEdgeColor','k');
% Plot the Return to Baseline Point
plot(time(locbase),avesig(locbase),'yo','Markersize',8,'MarkerFaceColor','y','MarkerEdgeColor','k');
