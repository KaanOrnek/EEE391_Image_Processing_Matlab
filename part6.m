clc;
clear;
close all;
%------PART 6------
A=ReadMyImage('Part6x.bmp');
DisplayMyImage(A);

h = ReadMyImage('Part6h.bmp');
output = DSLSI2D(h,A);
DisplayMyImage(abs(output));
DisplayMyImage((abs(output)).^3);
DisplayMyImage((abs(output)).^5);

%function from part 3
function y = DSLSI2D(h, x)
    [Mh, Nh] = size(h);
    [Mx, Nx] = size(x);

    My = Mx + Mh - 1;
    Ny = Nx + Nh - 1;

    y = zeros(My, Ny);

    for k=0:Mh-1
        for l=0:Nh-1
            y(k+1:k+Mx,l+1:l+Nx)=y(k+1:k+Mx,l+1:l+Nx)+h(k+1,l+1)*x;
        end
    end
end