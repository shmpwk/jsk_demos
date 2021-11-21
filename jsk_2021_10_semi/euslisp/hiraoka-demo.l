(when (not (boundp '*room73b2*))
  (require "models/room73b2-scene.l")
  (setq *room73b2* (room73b2)))

(when (not (boundp '*nao*))
  (require "package://naoeus/nao.l")
  (setq *nao* (NaoH25V50)))

(when (not (boundp '*fetch*))
  (require "package://fetcheus/fetch.l")
  (setq *fetch* (fetch)))

(when (not (boundp '*spotkinova*))
  (require "package://spotkinovaeus/spotkinova.l")
  (setq *spotkinova* (spotkinova)))

(when (not (boundp '*jaxon*))
  (require "package://cart_humanoid/euslisp/jaxon_red.l")
  (setq *jaxon* (JAXON_RED)))

(when (not (boundp '*pr2*))
  (require "package://pr2eus/pr2.l")
  (setq *pr2* (pr2)))

(objects (list *room73b2* *nao* *fetch* *pr2* *spotkinova* *jaxon*))

(defun wait-for-human ()
  (send *jaxon* :locate #f(50 0 1000) :worldpos)
  (send *jaxon* :reset-pose)
  (send *irtviewer* :draw-objects)
  )

(defun move-to-spot(spot)
  (let ((coods-dif (send *jaxon* :transformation (send *room73b2* :spot spot))))
    (send *jaxon* :calc-walk-pattern-from-footstep-list (send *jaxon* :go-pos-params->footstep-list (aref (send coods-dif :pos) 0) (aref (send coods-dif :pos) 1) (rad2deg (elt (car (euler-angle (send coods-dif :rot))) 2)))
	  :debug-view
	  :no-message
	  :default-step-height 120)
  )
  nil
  )

(defun full-ik (rarm-tgt larm-tgt rleg-tgt lleg-tgt)
  ;;両手先、足先の目標。位置姿勢を維持するかどうか、指令するかどうか
  (let (
	(ra (if (null rarm-tgt) (make-cascoords) (if (eq t rarm-tgt) (send *jaxon* :rarm :end-coords ) rarm-tgt)))
	(la (if (null larm-tgt) (make-cascoords) (if (eq t larm-tgt) (send *jaxon* :larm :end-coords ) larm-tgt)))
	(rl (if (null rleg-tgt) (make-cascoords) (if (eq t rleg-tgt) (send *jaxon* :rleg :end-coords ) rleg-tgt)))
	(ll (if (null lleg-tgt) (make-cascoords) (if (eq t lleg-tgt) (send *jaxon* :lleg :end-coords ) lleg-tgt)))
	)
    (send *jaxon* :fullbody-inverse-kinematics (list ra la rl ll)
	  :link-list  (list (send *jaxon* :link-list (send *jaxon* :rarm :end-coords :parent))
			    (send *jaxon* :link-list (send *jaxon* :larm :end-coords :parent))
			    (send *jaxon* :link-list (send *jaxon* :rleg :end-coords :parent))
			    (send *jaxon* :link-list (send *jaxon* :lleg :end-coords :parent)))
	  :move-target (list (send *jaxon* :rarm :end-coords )
			     (send *jaxon* :larm :end-coords )
			     (send *jaxon* :rleg :end-coords )
			     (send *jaxon* :lleg :end-coords ))
	  :rotation-axis (list (not (null rarm-tgt)) (not (null larm-tgt)) (not (null rleg-tgt)) (not (null lleg-tgt)))
	  :translation-axis (list (not (null rarm-tgt)) (not (null larm-tgt)) (not (null rleg-tgt)) (not (null lleg-tgt)))
	  :debug-view
	  :no-message
	  )
    )
  )

(defun search-fridge()
  (full-ik nil (make-cascoords :pos #f(5350 1480 1300) :rpy #f(0 0 0)) (make-cascoords :pos #f(4500 1200 40)) t) ;冷蔵庫に手をつく
  (unix::sleep 1)
  (full-ik (make-cascoords :pos #f(5350 1480 400) :rpy #f(0 0.85 0)) t t t)  ;冷蔵庫の取手に手をのばす
  (unix::sleep 1)
  (setq *handle* (send (send *room73b2* :object "room73b2-hitachi-fiesta-refrigerator") :link :room73b2-hitachi-fiesta-refrigerator-bodyset5))
  (send (send *handle* :parent-link) :dissoc *handle*)
  (send *jaxon* :rarm :end-coords :assoc *handle*)
  (full-ik (make-cascoords :pos #f(5050 1480 400) :rpy #f(0 0.85 0)) t t t) ;冷蔵庫の引き出しを引く
  (unix::sleep 1)
  (send *jaxon* :head :angle-vector #f(30 0))
  (unix::sleep 1)
  (send *jaxon* :head :angle-vector #f(-90 0))
  (unix::sleep 1)
  (send *jaxon* :head :angle-vector #f(0 0))
  (full-ik (make-cascoords :pos #f(5350 1480 400) :rpy #f(0 0.85 0)) t t t)
  (unix::sleep 1)
  (send *jaxon* :rarm :end-coords :dissoc *handle*)
  nil
  )

(defun all-task ()
  (wait-for-human)
  (send *jaxon* :calc-walk-pattern-from-footstep-list (send *jaxon* :go-pos-params->footstep-list 2300 0 0) :debug-view :no-message :default-step-height 120);机の横まで移動
  (move-to-spot "fridge-front-spot");冷蔵庫の前まで移動  
  (search-fridge)
 )
