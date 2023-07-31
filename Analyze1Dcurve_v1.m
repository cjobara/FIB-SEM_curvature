
function Analyze1Dcurve_v1(curve)

[A,B,C]=curvature(curve);

figure(1)
axis square
plot(curve(:,1),curve(:,2));
hold on
scatter(curve(end,1),curve(end,2),[],'k','filled');
quiver(curve(:,1),curve(:,2),C(:,1),C(:,2))
set(gcf,"Position",[100 500 500 500])

figure(2)
set(gcf,"Position",[600 500 700 700])
subplot(4,1,1)
plot(1:size(curve,1),A);
hold on
subplot(4,1,2)
plot(1:size(curve,1),B);
hold on
subplot(4,1,3)
plot(1:size(curve,1),C(:,1));
hold on
subplot(4,1,4)
plot(1:size(curve,1),C(:,2));
hold on
xlabel('Parametric Index');

end
