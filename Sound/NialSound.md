# Nial Sound

Stuart Smith

## Simple Oscillators

### cosine

y := cosine freq dur sr ;

Generates samples of a sinewave of specified frequency and duration

Inputs:

freq = frequency in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### osc

y := osc freq phs dur wave sr ;

Generic oscillator. Creates a periodic signal from an arbitrary

user-supplied wave table. The table contains one cycle of the desired

waveform. The first and last items in the wave table must be identical.

The table can be created with one of the other oscillator functions. For
example, a table of 513 samples of a single sinewave cycle can be
created with

wave := sine 1 1 512 ; % Generate 1 Hz sinewave for 1 sec.

wave := wave link wave@0 ; % Append a final element identical to

% the first

Inputs:

freq = frequency of the desired signal in Hz

phs = starting phase in degrees, \[0,360\]

dur = signal duration in seconds

wave = user-supplied vector of one cycle of the desired waveform

sr = sample rate in samples per second

Output:

vector of samples

### sawtooth

y := sawtooth freq dur sr ;

Generates samples of a sawtooth wave of specified frequency and
duration.

Inputs:

freq = frequency in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### sine

y := sine freq dur sr ;

Generates samples of a sinewave of specified frequency and duration.

Inputs:

freq = frequency in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### spike

y := spike freq dur sr ;

Generates a stream of unit impulses of specified frequency and duration.

Inputs:

freq = frequency in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### square

y := square freq dur sr ;

Generates samples of a square wave of specified frequency and duration.

Inputs:

freq = frequency in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### unit

y := unit dur sr ;

Creates a unit impulse within an interval of specified duration.

Inputs:

dur = duration of the time interval in which the impulse occurs

sr = sample rate in samples per second

Output:

unit impulse

## Other Sound Generators

### formant

y := formant f0 f1 f2 f3 dur sr ;

Formant synthesizer. See **formantDemo** for a demonstration of the use
of this function to create vowel sounds.

Inputs:

f0 = fundamental frequency in Hz

f1, f2, f3 = formant frequencies in Hz

dur = duration in seconds

sr = sample rate in samples per second

Output:

vector of samples

### fm\_instr

y := fm\_instr cf cm mi amp dur sr ;

Implements an FM instrument. The *amp* argument specifies the amplitudes
of a single multi-segment linear envelope, which is applied to both the
output amplitude and the modulation index. The modulating frequency is
obtained by c:m ratio. See **FM\_Demo** for a demonstration of the use
of **fm\_instr**.

Inputs:

cf = carrier frequency in Hz

cm = c:m ratio

mi = modulation index

amp = vector of ending amplitudes of envelope segments (start is

always 0)

dur = vector of segment durations in seconds

sr = sample rate in samples per second

Output

vector of samples

### noise

y := noise dur sr ;

Generate samples of white noise.

Inputs:

dur = duration of noise in seconds

sr = sample rate in samples per second

Output:

vector of samples

## Synthesizer Units

### vca

y := vca x ctrl ;

Uses a control signal to regulate the gain of the input signal. The
input signal should be in the range \[0,1\]. If the control signal goes
negative, the corresponding output samples will be set to zero. If the
input signal and the control signal are not of the same length, the
longer will be trimmed to the length of the shorter.

Inputs:

x = input signal

ctrl = control signal, \[0,1\]

Output:

vector of samples

### vcf

y := vcf x ctrl fl fh d sr ;

Applies a control signal to a resonant filter to continuously update the
filter’s center frequency. If the input signal and the control signal
are not of the same length, the longer will be trimmed to the length of
the shorter.

Inputs:

x = input signal

ctrl = control signal in the range \[0,1\]

fl = lowest center frequency of the filter in Hz

fh = highest center frequency of the filter in Hz

d = half-bandwidth of the filter in Hz

sr = sample rate in samples per second

Output:

vector of samples

### vco

y := vco wave ctrl flo fhi sr ;

Generic oscillator whose frequency is varied between lower and upper
limits by a time-varying control signal in the range \[0,1\]. If the
control signal goes below 0, the oscillator's frequency will be the
lower limit frequency. The output waveform is specified by an arbitrary
user-supplied wave table. The table contains one cycle of the desired
waveform. The first and last items in the wave table must be identical.
The table can be created with one of the other oscillator functions. For
example, a table of 513 samples of a single sinewave cycle can be
created with

wave := sine 1 1 512 ; % Generate 1 Hz sinewave for 1 sec.

wave := wave link wave@0 ; % Append a final element identical to

% the first

Inputs:

wave = user-supplied vector of one cycle of the desired waveform

ctrl = frequency control signal

flo = lowest allowable frequency in Hz

fhi = highest allowable frequency in Hz

sr = sample rate in samples per second

Output:

vector of samples

## Filters

### flt

y := flt x F D sr

Implements a resonant bandpass filter.

Inputs:

x = signal to be filtered

F = center frequency of the filter in Hz

D = half-bandwidth of the filter in Hz

sr = sample rate in samples per second

Output:

vector of samples

## Vibrato and Tremolo

### tremolo

y := tremolo x lfo mi sr ;

Applies tremolo (low-frequency amplitude modulations) to the input
signal.

Inputs:

x = input signal

lfo = tremolo frequency in Hz

mi = tremolo depth (normally in the range \[0,1\])

sr = sample rate in samples per second

Output:

vector of samples

### vibrato

y := vibrato x lfo mi sr ;

Applies vibrato (low-frequency frequency modulation) to the input
signal.

Inputs:

x = input signal

lfo = vibrato frequency (5-8 Hz typical)

mi = depth of vibrato (0.05 typical)

sr = sample rate in samples per second

Output:

vector of samples

## Dynamics Processing

### a\_r

y := a\_r x at rt sr ;

A simple attack/release envelope shaper.

Inputs:

x = input signal to which envelope is to be applied

at = attack time in seconds

rt = release time in seconds

sr = sample rate in samples per second

Output:

vector of samples

### crossfade

y := crossfade a b overlap sr ;

Performs a linear cross fade between vectors a and b.

Inputs:

a , b = input signals

overlap = duration of cross fade in seconds

sr = sample rate in samples per second

Output:

vector of samples

### env

Generates a multi-segment linear envelope. The envelope can be applied
to a signal with **vca**. *amp* and *dur* must be of the same length.

y := env amp dur sr ;

Inputs:

amp = vector containing the amplitude at the *end* of each

segment (starting amplitude is always 0)

dur = vector containing the durations of the segments

sr = sample rate in samples per second

Output:

vector of samples

### expa\_r

A simple attack/release envelope shaper similar to **a\_r**, except that
the attack and release are exponential rather than linear.

y := expa\_r x at rt ka kr sr ;

Inputs:

x = input signal

at = attack time in seconds

rt = release time in seconds

ka = attack constant (ka=8 typical)

kr = release constant (kr=8 typical)

sr = sample rate in samples per second

Output:

y = vector of samples

### expattack

Creates an exponential attack. The amplitude of the output rises from 0

to 1 over *dur* seconds.

y := expattack dur k sr ;

Inputs:

dur = duration of attack in seconds

k = attack constant (k=8 typical)

sr = sample rate in samples per second

Output:

vector of samples

### expdecay

Creates an exponential decay. The amplitude of the output decays from 1

to 2^(-k) over *dur* seconds.

y := expdecay dur k sr ;

Inputs:

dur = duration of decay in seconds

k = decay constant (k=8 typical)

sr = sample rate in samples per second

Output:

vector of samples

### FadeIn

y := FadeIn x fa sr ;

Attenuates the first *fa\*sr* elements of the vector x linearly from 0
to 1

Inputs:

x = input signal

fa = fade-in time in seconds

sr = sample rate in samples per second

Output:

vector of samples

### FadeOut

y := FadeOut x fa sr ;

Attenuates the last *fa\*sr* elements of the vector x linearly from 1 to
0.

Inputs:

x = input signal

fa = fade-out time in seconds

sr = sample rate in samples per second

Output:

vector of samples

## Delay Lines

### allpdelay

y := allpdelay x dly g sr ;

Allpass filter, which is typically used as a component of a Schroeder
reverb unit (also see **schroeder** in the ***reverbs*** section below.)

Inputs:

x = input signal

dly = length of delay in seconds

g = gain \[0,1\]

sr = sample rate in seconds

Output:

vector of samples

### firdelay

y := firdelay x dly g sr ;

A single-delay FIR comb filter. This can be used for simple echo and
reverb effects.

Inputs:

x = input signal

dly = delay time in seconds. Standard effects based on the length of

the delay are:

0 - .020 sec = resonator

.025 - .050 sec = slapback

.050 sec = echo

g = gain (0-1)

sr = sample rate in samples per second

Output:

vector of samples

### iirdelay

y := iirdelay x dly g sr ;

A single-delay IIR comb filter. This can be used for simple echo and

reverb effects.

Inputs:

x = input signal

dly = delay time in seconds

g = gain \[0,1\]

sr = sample rate in samples per second

Output:

vector of samples

### tdl, (tapped delay line)

y := tdl x d g sr ;

Tapped delay line. As many taps as desired may be specified.

Inputs:

x = input signal (mono vector only)

d = a vector that contains the delay length of each tap in seconds

g = a vector that contains the gain of each tap \[0,1\]

sr = sample rate in samples per second

Output:

vector of samples

### unidelay

y := unidelay x BL FB FF dly sr ;

Universal (FIR and IIR) comb filter with a single delay. See
**unidelayDemo** for examples of effects possible with this versatile
unit.

Inputs:

x = input signal

BL = blend control for feedforward of input sample \[0,1\]

FB = gain for feedback (iir) \[0,1\]

FF = gain for feedforward (fir) \[0,1\]

dly = length of delay in seconds

sr = sample rate in samples per second

Output:

vector of samples

## Reverb Units

### artrvb

Artificial (purely digital) reverb.

y := artrvb x predelay wet IRdur k sr ;

Inputs:

x = input signal

predelay = time in seconds for the arrival of the reverb tail

wet = percentage of wet sound in the output \[0,100\]

IRdur = duration of an exponentially decaying burst of white

noise, which serves as an “impulse response”

k = decay constant (k=8 typical)

sr = sample rate in samples per second

Output:

vector of samples

<span id="__RefHeading___Toc506041260" class="anchor"></span>**convrvb**

Simulates reverberation by convolving an input signal, x, with a
recorded or synthesized impulse response, ir.

y := convrvb x ir pct lpf sr ;

Inputs:

x = input signal (row vector, column vector, or stereo matrix)

ir = impulse response. Many ir's are available as free

downloads from the Web.

pct = percentage of "wet" sound in the output \[0,100\]

lpf = lowpass filter cutoff frequency for simulated air absorption of

high frequencies

sr = sample rate in samples per second (must be the same for *x* and

*IR*)

Output:

vector of samples

<span id="__RefHeading___Toc506041261" class="anchor"></span>**multirvb**

Artificial reverb that simulates a point source, multiple reflecting

surfaces, and a reverb tail.

y := multirvb x delay gain IRdur k sr ;

Inputs:

x = input signal

delay = vector of early reflection delays, in seconds ( \<= 0.100 )

gain = vector of gains, one for each delay, \[0,1\]

IRdur = duration of the late reverb, in seconds

k = decay constant (k=8 typical)

sr = sample rate in samples per second

Output:

y = vector of samples

### schroeder

y := schroeder x delays apdelay apgain rt60 sr ;

A Schroeder-type reverb. This is a more sophisticated unit than the

other reverb functions, offering the user greater control over the
reverb effect.

Inputs:

x = input vector of samples

delays = row vector of delay line (comb filter) lengths in seconds

example delays: \[ 0.0497 , 0.0674 , 0.0738 , 0.0750 \].

As many delays as desired may be used.

apdelay = allpass filter delay in seconds (e.g., 0.02)

apgain = allpass filter gain \[0,1\] (e.g., 0.5)

rt60 = the time taken for a sound to die away to one thousandth of

its original sound level, in seconds (e.g., 0.2 to 0.5

second for speech, 0.6 to 0.8 second for classical music)

sr = sample rate in samples per second

Output:

y = left/right vectors of samples

## Spatial Effects

### autopan

y := autopan x rate phase depth shape sr ;

Pans the input signal back and forth between the left and right
channels.

Inputs:

x = input signal

rate = LFO frequency in Hz.

phase = relative phase angle in degrees between channels

depth = depth of modulation index (normally in the range \[0,1\])

sr = sample rate in samples per second

Ouput:

y = left/right vectors of samples

### delaypan

y := delaypan x ch delay sr ;

Delay-based panning. Moves the apparent sound source *away* from the
selected channel.

Inputs:

x = input signal

ch = channel to be delayed (“L or “R)

delay = delay for selected channel in seconds (0.005 typical)

sr = sample rate in samples per second

Output:

y = left/right vectors of samples

### stereopan

y = stereopan( x , theta )

Tangent law stereophonic panning. This function assumes the stereo field
is 60 degrees wide. The apparent direction of the sound source can be
set to any angle between -30 (all the way left) to +30 (all the way
right).

y := stereopan x theta ;

Inputs:

x = input sound vector

theta = azimuth of source relative to listener, in degrees

Output:

y = left/right vectors of samples

## Pitch-changing and Resampling Functions

### deci

y := deci x ratio ;

Decimates the input signal, raising its pitch by up to one octave (e.g.,
a ratio of 2 gives the "chipmunk" or "munchkin" effect). NB: deci also
reduces the length of the input signal by a factor of 1/ratio.

Inputs:

x = input signal

ratio = pitch increase factor: 1=\<ratio\<=2

Output:

y = vector of samples

### lint

y := lint x ratio ;

Shifts the pitch of the input signal down by linearly interpolating

between samples. NB: this function will lengthen the duration of the

sound by a factor of 1/ratio. With speech input, this typically produces
the effect of slurred, drunken speech

Inputs:

x = input signal

ratio = pitch reduction factor, 0\<ratio\<= 1

Output:

y = vector of samples

### resample 

y := resample x newsr oldsr ;

Resamples an array of samples so it is usable at a higher or lower
sample rate without change of pitch or duration.

Inputs:

x = input signal

newsr = desired new sample rate

oldsr = original sample rate of x

Output:

y = vector of samples

## Stereo

### destereo

a b := destereo y ;

The inverse of the **stereo** function: it separates an interleaved
stereo vector into left/right vectors. These vectors may then be
manipulated by other sound functions.

Input:

y = interleaved stereo vector

Outputs:

a , b = left/right vectors of samples

### stereo

y := stereo a b ;

Combines two vectors into a single stereo vector. If the input vectors
do not have the same length, the longer will be trimmed to match the
length of the shorter.

Inputs:

a , b = input vectors

Output:

y = stereo vector of samples

## Data Conversions

### abs2dbfs

y := abs2dbfs x ;

Converts absolute units to dBFS.

Input:

x = quantity expressed in absolute units, 0=\<x\<=1

Ouput:

y = quantity converted to dB Full Scale units

<span id="__RefHeading___Toc506041276" class="anchor"></span>**dbfs2abs**

y := dbfs2abs x ;

Converts dBFS to absolute units.

Input:

x = quantity expressed in dB Full Scale, x\>0

Ouput:

y = quantity converted to absolute units

### freq2midi

nn := freq2midi f ;

This function converts from a given frequency to the MIDI note number of
the equal-temperament frequency that lies closest to it (based on a
reference frequency of A-440). This function and midi2freq are not exact
inverses, i.e.,

*midi2freq freq2midi f*

will not necessarily return the original value of *f*.

Input:

f = a frequency or vector of frequencies in Hz.

Output:

nn = the MIDI note number(s) most closely corresponding to f

### midi2freq

f := midi2freq m ;

Converts MIDI note numbers to frequencies in Hz

Input:

m = vector or matrix of MIDI note numbers (0-127)

Output:

f = vector or matrix of the corresponding frequencies

## General Vector Operations

### fastconv

cxy = fastconv( x , y )

Fast convolution of vectors x and y.

Inputs:

x = input vector (typically an impulse response)

y = input vector (typically sound samples)

Output:

cxy = x convolved with y

### linspace

y := linspace b e n ;

Generates a vector of n equally-spaced points between b and e

Inputs:

b = beginning value of output vector

e = ending value of output vector

n = desired number of points

Output:

vector of points

### normalize

y := normalize x ;

Normalizes a vector to the range \[-1,1\], which is the standard range
for audio samples

Input:

x = numeric vector

Output:

normalized vector

### range

y := range b e ;

Generates a vector of consecutive integers

Inputs:

b = beginning integer

e = ending integer

Output:

vector of integers

### trim

\[ a b \] = trim( x , y )

Trims the length of the longer of two vectors to the length of the
shorter vector.

Inputs:

x , y = any vectors

Outputs:

a , b = vectors trimmed to the length of the shorter of x and y

## Sound I/O Functions

### play

play x sr ;

play ( left right ) sr ;

Plays the sound represented by the samples in the input vector(s).
**play** plays the samples as-is. Clipping will occur on samples out of
the range \[-1,1\].

Inputs:

x = vector of sound samples,(left right) for stereo

sr = sample rate in samples per second

### wavread

*nch n sr samples* := wavread *filename* ;

Input:

*filename* = string containing the name of the file to be read in

Outputs:

nch = number of channels

n = number of samples

sr = sample rate in samples per second

samples = vector of samples

Reads the .wav file *filename* and stores the number of channels, number
of samples, sample rate, and samples

### wavwrite

wavwrite Filename x sr ;  
wavwrite Filename (left,right) sr ;

Writes the sound samples in *x* to the .wav file *filename*.

Inputs:

filename = string containing the name of the file to be written

(include .wav file extension)

x = vector of samples to be written to a file (left/right

vectors for stereo)

sr = sample rate in samples per second

### wavplay

wavplay filename ;

Plays the named file

Input:

filename = name of the .wav file to be played (include the .wav file

extension)

## Demos

<span id="__RefHeading___Toc506041291" class="anchor"></span>apfilterDemo.ndf

Allpass filter applied to white noise

<span id="__RefHeading___Toc506041292" class="anchor"></span>delaylineDemo.ndf

Demonstrates the effects of the different delay line-based units

<span id="__RefHeading___Toc506041293" class="anchor"></span>explosionDemo.ndf

Simulated explosion sounds

<span id="__RefHeading___Toc506041294" class="anchor"></span>filtersweepDemo.ndf

Demonstrates the resonant bandpass filter, **vcf**

<span id="__RefHeading___Toc506041295" class="anchor"></span>FM\_Demo.ndf

Demonstrates how FM synthesis can be used to simulate a variety of
musical instrument timbres

<span id="__RefHeading___Toc506041296" class="anchor"></span>formantDemo.ndf

Demonstrates the use of the **formant** function to generate vowel
sounds

<span id="__RefHeading___Toc506041297" class="anchor"></span>leslieDemo.ndf

Demonstrates various effects that can be achieved with the **leslie**
function

<span id="__RefHeading___Toc506041298" class="anchor"></span>noise\_gateDemo.ndf

Demonstrates the use of a noise gate to “tighten” the sound of
percussion instruments

<span id="__RefHeading___Toc506041299" class="anchor"></span>phaserDemo.ndf

Wah-wah and phaser effects

<span id="__RefHeading___Toc506041300" class="anchor"></span>pinknoiseDemo.ndf

random-note “melody” composer

<span id="__RefHeading___Toc506041301" class="anchor"></span>pitchshiftDemo.ndf

changing pitch without changing note duration

<span id="__RefHeading___Toc506041302" class="anchor"></span>reverbDemo.ndf

Demonstrates various reverb algorithms

<span id="__RefHeading___Toc506041303" class="anchor"></span>schroederDemo.ndf

Demonstrates the classic Schroeder reverb unit

<span id="__RefHeading___Toc506041304" class="anchor"></span>sincfilterDemo.ndf

Highpass, lowpass, bandpass, and bandstop filters

<span id="__RefHeading___Toc506041305" class="anchor"></span>spaceDemo.ndf

Demonstrates left/right placement of sound in the stereo panorama

<span id="__RefHeading___Toc506041306" class="anchor"></span>superpanDemo.ndf

Place sound right, left, foreground, or background in the stereo
panorama

<span id="__RefHeading___Toc506041307" class="anchor"></span>touchtoneDemo.ndf

Demonstrates how to play a simple sequence of tones or musical notes

<span id="__RefHeading___Toc506041308" class="anchor"></span>unidelayDemo.ndf

Demonstrates various effects that can be achieved with **unidelay**

<span id="__RefHeading___Toc506041309" class="anchor"></span>VCO\_Demo.ndf

Sound effects created with a simulated Voltage-controlled oscillator

###
