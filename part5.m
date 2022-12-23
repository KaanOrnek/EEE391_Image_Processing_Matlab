clc;
clear;
close all;
%------PART 5------
A=ReadMyImage('Part5.bmp');
DisplayMyImage(A);
h_1 = [1 0 -1; 2 0 -2; 1 0 -1];

A_1 = DSLSI2D(h_1,A);
DisplayMyImage((sqrt(A_1)));

h_2 = [1 2 1; 0 0 0; -1 -2 -1];
A_2 = DSLSI2D(h_2,A);
DisplayMyImage((sqrt(A_2)));

DisplayMyImage(sqrt((A_2).^2 + (A_1).^2 ));

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


