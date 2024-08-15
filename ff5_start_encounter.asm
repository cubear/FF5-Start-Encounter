;start button forces encounter by cubear 07-21-2024


hirom

org $C0CABF ;dungeon
 jsl force_encounter;sta $16a8 
 nop ;lda $06

org $C0CBC8 ;world map
 jml force_encounter_world ;cmp $16a9
							;bcs c0cc20
							
org $FAF220
force_encounter:
 pha
 lda $02 ;start_button_pressed
 AND #$1000 
 beq start_not_pressed
 pla
 LDA #$FF00 ;trigger encounter
 bra done
start_not_pressed:
 pla
 
 
;UNCOMMENT THIS FOR NO START = NO ENCOUNTERS
; lda #$0000 ; no start = no encounters
;END COMMENT ZONE



done:
 sta $16A8
 lda $06
 rtl

force_encounter_world:
 pha
 lda $03 ;start_button_pressed
 AND #$10 
 beq start_not_pressed_world
 pla
 clc
do_encounter_world:
 jml $C0CBCD
start_not_pressed_world:
 pla
 
 
;COMMENT THESE OUT FOR NO START = NO ENCOUNTERS
 cmp $16A9
 bcc do_encounter_world 
;END COMMENT ZONE

;else
 jml $C0CC20
;eof