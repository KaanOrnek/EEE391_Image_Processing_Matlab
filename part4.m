%------PART 4------
A=ReadMyImage('Part4.bmp');

mean = 0;
std1 = 0.1;
std2 = 0.25;
std3 = 0.5;


% Add Gaussian noise to the image with the specified mean and standard deviation
Anoise1 = A + random('norm', mean, std1, size);
Anoise2 = A + random('norm', mean, std2, size);
Anoise3 = A + random('norm', mean, std3, size);

% DisplayMyImage(A);
% DisplayMyImage(Anoise1);
% DisplayMyImage(Anoise2);
% DisplayMyImage(Anoise3);

D = 21901637; %my bilkentId
D_17 = rem(D,17);
M_h = 20+D_17;
N_h = 20+D_17;


B = 0.5;

% prepare h
h = zeros(M_h, N_h);
for m = 1:M_h
    for n = 1:N_h
        if m < 1 || n < 1 || m > M_h || n > N_h
            h(m,n) = 0;
        else
            h(m,n) = sinc(B*(m-((M_h-1)/2)))*sinc(B*(n-((N_h-1)/2)));
        end
    end
end
h = h / sum(h(:));

Anoise3filtered1 = DSLSI2D(h,Anoise3);

DisplayMyImage(Anoise3filtered1);

B = 0.2;

h = zeros(M_h, N_h);
for m = 1:M_h
    for n = 1:N_h
        if m < 1 || n < 1 || m > M_h || n > N_h
            h(m,n) = 0;
        else
            h(m,n) = sinc(B*(m-((M_h-1)/2)))*sinc(B*(n-((N_h-1)/2)));
        end
    end
end
h = h / sum(h(:));

Anoise3filtered2 = DSLSI2D(h,Anoise3);

DisplayMyImage(Anoise3filtered2);



B = 0.05;

h = zeros(M_h, N_h);
for m = 1:M_h
    for n = 1:N_h
        if m < 1 || n < 1 || m > M_h || n > N_h
            h(m,n) = 0;
        else
            h(m,n) = sinc(B*(m-((M_h-1)/2)))*sinc(B*(n-((N_h-1)/2)));
        end
    end
end
h = h / sum(h(:));

Anoise3filtered3 = DSLSI2D(h,Anoise3);

DisplayMyImage(Anoise3filtered3);

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