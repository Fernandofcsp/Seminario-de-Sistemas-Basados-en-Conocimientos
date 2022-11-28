%Sandoval Padilla Fernando Cesar
%Saldivar Fonseca Francisco
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
main:-proyecto_se,repeat, abolish(si_no/2),
    dynamic(si_no/2),
    diagnosticomedico,nl,nl,
    write('Desea realizar otra consulta? (s/n)'),read(Respuesta),\+ Respuesta=s,nl,
    abolish(si_no,2).

proyecto_se:-nl,nl,
write('Sistema Experto Para el Diagnostico de enfermedades'),nl,
write('_________________________________________________________________________________________________________________________________'),nl.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Guia para identificar la enfermedad (preguntas detonantes).

padece_reflujo_gastrico:- pregunta('Padece de ardor en el estomago?'),!.
padece_sindrome_de_intestino_irritable:- pregunta('Padece de diarrea?'),!.
padece_infeccion_de_oido_y_garganta:- pregunta('Padece de dolor de oido?'),!.
padece_infeccion_orinaria:- pregunta('Padece dolor o ardor al orinar?'),!.
padece_infeccion_de_la_piel:- pregunta('Padece de enrojecimiento en la piel?'),!.
padece_diabetes:-pregunta('Padece de orinar con frecuencia?'),!.
padece_alergia:- pregunta('Padece de congestion nasal?'),!.
padece_obesidad:-pregunta('Padece de baja resistencia fisica?'),!.
padece_bronquitis:- pregunta('Padece de tos con o sin mucosidad?'),!.
padece_resfriado_comun:- pregunta('Padece de estornudos?'),!.
padece_covid:- pregunta('Padece de perdida del gusto o del olfato?'),!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Reglas, base de conocimiento de sintomas.

enfermedad(reflujo_gastrico):-padece_reflujo_gastrico,
pregunta('Padece de perdida de peso?'),
pregunta('Padece de nauseas repentinas?'),
pregunta('Padece de hipo y eructos frecuentes?'),
pregunta('Padece de mal sabor de boca?').

enfermedad(sindrome_de_intestino_irritable):-padece_sindrome_de_intestino_irritable,
pregunta('Padece de estreñimiento?'),
pregunta('Padece de dolor e inflacion abdominal?').

enfermedad(infeccion_de_oido_y_garganta):- padece_infeccion_de_oido_y_garganta,
pregunta('Padece de dolor de garganta?'),
pregunta('Padece de fiebre?').

enfermedad(infeccion_orinaria):- padece_infeccion_orinaria,
pregunta('Orina con frecuencia?').

enfermedad(infeccion_de_la_piel):- padece_infeccion_de_la_piel,
pregunta('Padece de hinchazon o inflamacion en la piel?').

enfermedad(diabetes):- padece_diabetes,
pregunta('Padece de sed constante?'),
pregunta('Padece de hambre excesiva?'),
pregunta('Padece de perdida de peso inexplicable?'),
pregunta('Padece de debilidad en su cuerpo?'),
pregunta('Padece de irritabilidad?'),
pregunta('Padece de vision borrosa?').

enfermedad(alergia):- padece_alergia,
pregunta('Padece de estornudos constantes?'),
pregunta('Padece de lagrimeo y enrojecimiento de los ojos?'),
pregunta('Padece de tos seca?'),
pregunta('Padece de dificultad respiratoria?').

enfermedad(obesidad):- padece_obesidad,
pregunta('Padece de sudoracion excesiva?'),
pregunta('Padece de molestias articulares?'),
pregunta('Padece de dolor y calambres en las piernas?').

enfermedad(bronquitis):- padece_bronquitis,
pregunta('Padece de dolor de cabeza?'),
pregunta('Padece de dolores corporales?'),
pregunta('Padece de dolor de garganta?'),
pregunta('Padece de dolor corporal?').

enfermedad(resfriado_comun):- padece_resfriado_comun,
pregunta('Padece de moqueo o congestion nasal?'),
pregunta('Padece de dolor de garganta?'),
pregunta('Padece tos?').

enfermedad(covid):- padece_covid,
pregunta('Padece de fiebre?'),
pregunta('Padece de tos?'),
pregunta('Padece de cansancio?').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Con esta regla se obtienen las respuestas a las preguntas, se valida si fue un si o un no.

pregunta(Sintoma):-nl,write(Sintoma),nl,write(' (s/n)'),
                  nl, read(Respuesta),
                  ((Respuesta=s, assert(si_no(Sintoma, true)));
                  (assert(si_no(Sintoma, false)),fail)).

% Reglas para mostrar los resultados, si se obtiene positivo entra la primera, si es negativo, entra la segunda.

diagnosticomedico:-write(''),nl,
                   enfermedad(Enfermedad),!,nl,
                   write('**************************RESULTADOS**************************'),nl,nl,
                   write('Segun sus sintomas, es muy probable que Ud. tenga: '),nl,nl,
                   write('                  '), write(Enfermedad),nl,nl,
                   write('**************************************************************').

diagnosticomedico:-nl,write('**************************RESULTADOS**************************'),nl,nl,
                   write('Enfermedad Desconocida'),nl,nl,
                   write('**************************************************************').
