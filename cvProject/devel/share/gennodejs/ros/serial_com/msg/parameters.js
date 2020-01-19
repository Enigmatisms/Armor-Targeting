// Auto-generated. Do not edit!

// (in-package serial_com.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class parameters {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pitch = null;
      this.yaw = null;
      this.v1 = null;
      this.v2 = null;
      this.v3 = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('v1')) {
        this.v1 = initObj.v1
      }
      else {
        this.v1 = 0.0;
      }
      if (initObj.hasOwnProperty('v2')) {
        this.v2 = initObj.v2
      }
      else {
        this.v2 = 0.0;
      }
      if (initObj.hasOwnProperty('v3')) {
        this.v3 = initObj.v3
      }
      else {
        this.v3 = 0.0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type parameters
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [v1]
    bufferOffset = _serializer.float32(obj.v1, buffer, bufferOffset);
    // Serialize message field [v2]
    bufferOffset = _serializer.float32(obj.v2, buffer, bufferOffset);
    // Serialize message field [v3]
    bufferOffset = _serializer.float32(obj.v3, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type parameters
    let len;
    let data = new parameters(null);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v1]
    data.v1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v2]
    data.v2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [v3]
    data.v3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'serial_com/parameters';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b597e20a84aedc1861374aeb02f3e1b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pitch
    float32 yaw
    float32 v1
    float32 v2
    float32 v3
    uint8 status
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new parameters(null);
    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.v1 !== undefined) {
      resolved.v1 = msg.v1;
    }
    else {
      resolved.v1 = 0.0
    }

    if (msg.v2 !== undefined) {
      resolved.v2 = msg.v2;
    }
    else {
      resolved.v2 = 0.0
    }

    if (msg.v3 !== undefined) {
      resolved.v3 = msg.v3;
    }
    else {
      resolved.v3 = 0.0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

module.exports = parameters;
