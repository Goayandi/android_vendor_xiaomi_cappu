set -x

# setup main mic
tinymix "RECMIX1L BST1 Switch" 0
tinymix "RECMIX1R BST1 Switch" 0
tinymix -D 0 "RECMIX1L BST3 Switch" 1
tinymix -D 0 "RECMIX1R BST3 Switch" 1
tinymix -D 0 "RECMIX1L BST4 Switch" 0
tinymix -D 0 "RECMIX1R BST4 Switch" 0
tinymix -D 0 "Stereo1 ADC Source" "ADC1"
tinymix -D 0 "Stereo1 ADC1 Source" "ADC"
tinymix -D 0 "Stereo1 ADC MIXL ADC1 Switch" 1
tinymix -D 0 "Stereo1 ADC MIXR ADC1 Switch" 1

# setup headphone
tinymix -D 0 "DAC1 MIXL Stereo ADC Switch" 1
tinymix -D 0 "DAC1 MIXR Stereo ADC Switch" 1
tinymix -D 0 "DAC1 MIXL DAC1 Switch" 0
tinymix -D 0 "DAC1 MIXR DAC1 Switch" 0
tinymix -D 0 "Stereo DAC MIXL DAC L1 Switch" 1
tinymix -D 0 "Stereo DAC MIXR DAC R1 Switch" 1
tinymix -D 0 "DAC L1 Source" "Stereo DAC Mixer"
tinymix -D 0 "DAC R1 Source" "Stereo DAC Mixer"
tinymix -D 0 "HPO L Playback Switch" 1
tinymix -D 0 "HPO R Playback Switch" 1
