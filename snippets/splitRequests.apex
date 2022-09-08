// If the list size is above the limit, split the request according to split limit

final Integer SPLIT_LIMIT = 800;
Integer listSize = 1500;
Integer startPosition = 0;
Integer endPosition = SPLIT_LIMIT - 1;

if ( listSize > SPLIT_LIMIT) {
    Decimal ratio = (Decimal.valueOf(listSize) / Decimal.valueOf(SPLIT_LIMIT));
    Integer numberOfRequests = Integer.valueOf(ratio.round(System.RoundingMode.CEILING));
    Integer shortRound = listSize - (SPLIT_LIMIT * (numberOfRequests - 1));
    System.debug('**** Number of Requests: ' + numberOfRequests);
    System.debug('**** Short Round: ' + shortRound);
    
    for (Integer i = numberOfRequests; i > 0; i-- ) {
        System.debug('**** Current Request: From ' + startPosition + ' to ' + endPosition);
        //Set new range if there will be another round
        if (i > 1) {
            startPosition += SPLIT_LIMIT;
            System.debug('**** New Start Position: ' + startPosition);
            if (i > 2) {
                endPosition += SPLIT_LIMIT;
                System.debug('**** New End Position A: ' + endPosition);
            } else {
                endPosition += shortRound;
                System.debug('**** New End Position B: ' + endPosition);
            }
        }
    }
}
