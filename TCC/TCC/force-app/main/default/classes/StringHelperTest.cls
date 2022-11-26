@isTest
private class StringHelperTest {

    @isTest
    public static void givenValueThenApplyNullEvaluationConvertToEmpty () {

        System.assert( StringHelper.nullToEmpty( null ) == '' );
        System.assert( StringHelper.nullToEmpty( '' ) == '' );
        System.assert( StringHelper.nullToEmpty( 'null' ) == 'null' );
    }

    @isTest
    public static void givenCurrencyValueWhenConvertThenReturnDecimalValue () {

        System.assert( StringHelper.parseCurrencyToDecimal( ' R$   110,00 ' ) == 110.00 );
        System.assert( StringHelper.parseCurrencyToDecimal( 'R$ 110,00' ) == 110.00 );
        System.assert( StringHelper.parseCurrencyToDecimal( 'R$100,00' ) == 100.00 );
        System.assert( StringHelper.parseCurrencyToDecimal( 'R$0,00' ) == 0.0 );
        System.assert( StringHelper.parseCurrencyToDecimal( '' ) == 0.0 );
        System.assert( StringHelper.parseCurrencyToDecimal( 'R$ 100,99' ) == 100.99 );
        System.assert( StringHelper.parseCurrencyToDecimal( 'R$ 1.000,99' ) == 1000.99 );
    }
}