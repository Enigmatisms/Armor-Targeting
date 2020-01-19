;; Auto-generated. Do not edit!


(when (boundp 'serial_com::parameters)
  (if (not (find-package "SERIAL_COM"))
    (make-package "SERIAL_COM"))
  (shadow 'parameters (find-package "SERIAL_COM")))
(unless (find-package "SERIAL_COM::PARAMETERS")
  (make-package "SERIAL_COM::PARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude parameters.msg.html


(defclass serial_com::parameters
  :super ros::object
  :slots (_pitch _yaw _v1 _v2 _v3 _status ))

(defmethod serial_com::parameters
  (:init
   (&key
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:v1 __v1) 0.0)
    ((:v2 __v2) 0.0)
    ((:v3 __v3) 0.0)
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _v1 (float __v1))
   (setq _v2 (float __v2))
   (setq _v3 (float __v3))
   (setq _status (round __status))
   self)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:v1
   (&optional __v1)
   (if __v1 (setq _v1 __v1)) _v1)
  (:v2
   (&optional __v2)
   (if __v2 (setq _v2 __v2)) _v2)
  (:v3
   (&optional __v3)
   (if __v3 (setq _v3 __v3)) _v3)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _v1
    4
    ;; float32 _v2
    4
    ;; float32 _v3
    4
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v1
       (sys::poke _v1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v2
       (sys::poke _v2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _v3
       (sys::poke _v3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v1
     (setq _v1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v2
     (setq _v2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _v3
     (setq _v3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get serial_com::parameters :md5sum-) "b597e20a84aedc1861374aeb02f3e1b6")
(setf (get serial_com::parameters :datatype-) "serial_com/parameters")
(setf (get serial_com::parameters :definition-)
      "float32 pitch
float32 yaw
float32 v1
float32 v2
float32 v3
uint8 status
")



(provide :serial_com/parameters "b597e20a84aedc1861374aeb02f3e1b6")


