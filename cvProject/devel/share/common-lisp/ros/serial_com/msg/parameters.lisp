; Auto-generated. Do not edit!


(cl:in-package serial_com-msg)


;//! \htmlinclude parameters.msg.html

(cl:defclass <parameters> (roslisp-msg-protocol:ros-message)
  ((pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (v1
    :reader v1
    :initarg :v1
    :type cl:float
    :initform 0.0)
   (v2
    :reader v2
    :initarg :v2
    :type cl:float
    :initform 0.0)
   (v3
    :reader v3
    :initarg :v3
    :type cl:float
    :initform 0.0)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass parameters (<parameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <parameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'parameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name serial_com-msg:<parameters> is deprecated: use serial_com-msg:parameters instead.")))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:pitch-val is deprecated.  Use serial_com-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:yaw-val is deprecated.  Use serial_com-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'v1-val :lambda-list '(m))
(cl:defmethod v1-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:v1-val is deprecated.  Use serial_com-msg:v1 instead.")
  (v1 m))

(cl:ensure-generic-function 'v2-val :lambda-list '(m))
(cl:defmethod v2-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:v2-val is deprecated.  Use serial_com-msg:v2 instead.")
  (v2 m))

(cl:ensure-generic-function 'v3-val :lambda-list '(m))
(cl:defmethod v3-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:v3-val is deprecated.  Use serial_com-msg:v3 instead.")
  (v3 m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <parameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader serial_com-msg:status-val is deprecated.  Use serial_com-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <parameters>) ostream)
  "Serializes a message object of type '<parameters>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'v3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <parameters>) istream)
  "Deserializes a message object of type '<parameters>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'v3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<parameters>)))
  "Returns string type for a message object of type '<parameters>"
  "serial_com/parameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'parameters)))
  "Returns string type for a message object of type 'parameters"
  "serial_com/parameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<parameters>)))
  "Returns md5sum for a message object of type '<parameters>"
  "b597e20a84aedc1861374aeb02f3e1b6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'parameters)))
  "Returns md5sum for a message object of type 'parameters"
  "b597e20a84aedc1861374aeb02f3e1b6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<parameters>)))
  "Returns full string definition for message of type '<parameters>"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 v1~%float32 v2~%float32 v3~%uint8 status~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'parameters)))
  "Returns full string definition for message of type 'parameters"
  (cl:format cl:nil "float32 pitch~%float32 yaw~%float32 v1~%float32 v2~%float32 v3~%uint8 status~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <parameters>))
  (cl:+ 0
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <parameters>))
  "Converts a ROS message object to a list"
  (cl:list 'parameters
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':v1 (v1 msg))
    (cl:cons ':v2 (v2 msg))
    (cl:cons ':v3 (v3 msg))
    (cl:cons ':status (status msg))
))
