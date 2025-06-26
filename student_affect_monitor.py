from scipy.spatial import distance as dist

# Constants used in both real-time and API logic
EAR_THRESH = 0.23
LEFT_EYE  = [33,160,158,133,153,144]
RIGHT_EYE = [362,385,387,263,373,380]

RAW_TO_HIGH = {
    "angry"   : "tension/frustration",
    "fear"    : "tension/frustration",
    "disgust" : "confusion",
    "surprise": "confusion",
    "sad"     : "boredom",
    "happy"   : "engagement/focus",
    "neutral" : "engagement/focus"
}

def harmonise(raw_face, tired_flag):
    return "tired" if tired_flag else RAW_TO_HIGH.get(raw_face, "engagement/focus")

def ear(pts):
    A = dist.euclidean(pts[1], pts[5])
    B = dist.euclidean(pts[2], pts[4])
    C = dist.euclidean(pts[0], pts[3])
    return (A + B) / (2.0 * C)
