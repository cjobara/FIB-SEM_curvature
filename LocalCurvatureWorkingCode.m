
% LocalCurvatureWorkingCode

 ExtractCurvatureofERtraces(EMstruct,index)

    % Figure out how long the curve is for sampling density
    [length,~,~]=curvature(EMstruct(index).curve);
        % remove scale factor 
        length=length(end)/5;

    % Use a least squares best fit to identify the mean curvature

    [Center]=CircleFitByPratt(EMstruct(index).curve);

    % Decimate the curve to remove tracing noise

    tempCurve=NaN([floor(length/10) 2 10]);

    for i=1:10
        Steps=i:10:floor(length/10)*10;
        tempCurve(:,:,i)=EMstruct(index).curve(Steps,:);
    end

    for i=4
    A=1:i^2:floor(154/(i^2))*i^2;

    Analyze1Dcurve_v1(EM(1).curve(A,:))

    end


close all
for i=[9 11 13 15]
    A=1:i:floor(154/(i))*i;

    Analyze1Dcurve_v1(EM(k).curve(A,:))

end



