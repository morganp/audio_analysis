function run_calc_fft_test
%RUN_CALC_FFT_TEST Test for calc_fft

  clear;
   
  % Add package path
  addpath('../package/');

  % import functions
  import audio_analysis.* ;

  %% Data passed to functions
  data_attrib.fin = 993    ;
  data_attrib.fs  = 48000  ;
  
  %% Parameters of generated data, Verify result against
  magnitude       = 10^(-0.1/20); % -0.1dB
  fftsize         = 65536;

  %% Create test data
  sim_length      = fftsize/data_attrib.fs    ;  % run sim for this time
  t               = 0:1/data_attrib.fs:sim_length-1/data_attrib.fs;                

  data            = ((magnitude)*sin(2*pi*data_attrib.fin*t))';

  measurement     = audio_analysis.calc_fft(data, fftsize);
  
  % Visualise data until Pass/Fail test added
  plot(measurement);

  error('No Pass/Fail criteria')

end

